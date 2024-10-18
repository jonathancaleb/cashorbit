import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sa3_liquid/liquid/plasma/plasma.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/functions.dart';

/// A widget that displays budget information including title, total, spent amount, and a timeline.
class BudgetContainer extends StatelessWidget {
  const BudgetContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.total,
    required this.spent,
  }) : super(key: key);

  final String title; // Title of the budget
  final Color color; // Color for the budget display
  final double total; // Total budget amount
  final double spent; // Amount spent

  @override
  Widget build(BuildContext context) {
    var widget = Column(
      children: [
        Container(
          width: double.infinity,
          child: TextFont(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            textAlign: TextAlign.left,
          ),
        ),
        Container(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: TextFont(
                text: convertToMoney(spent),
                fontSize: 18,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Container(
                child: TextFont(
                  text: " left of ${convertToMoney(total)}",
                  fontSize: 13,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        BudgetTimeline(
            startDate: "Sept 1",
            endDate: "Oct 1",
            percent: spent / total * 100,
            color: color),
        Container(
          height: 14,
        ),
        const Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: TextFont(
              text: "You can keep spending 15\$ each day.",
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 8,
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
              color: color,
              offset: const Offset(0, 4.0),
              blurRadius: 15.0,
              spreadRadius: -5),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedGooBackground(color: color),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20,
                ),
                child: widget,
              ),
            ],
          ),
        ));
  }
}

class AnimatedGooBackground extends StatelessWidget {
  const AnimatedGooBackground({
    Key? key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.white,
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: PlasmaRenderer(
        type: PlasmaType.infinity,
        particles: 10,
        color: color,
        blur: 0.5,
        size: 1.3,
        speed: 2.9,
        offset: 0,
        blendMode: BlendMode.srcOver,
        particleType: ParticleType.atlas,
        variation1: 0,
        variation2: 0,
        variation3: 0,
        rotation: 0,
      ),
    );
  }
}

/// A widget that displays a timeline for the budget.
class BudgetTimeline extends StatelessWidget {
  BudgetTimeline({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.percent,
    required this.color,
  }) : super(key: key);

  final String startDate; // Start date of the budget period
  final String endDate; // End date of the budget period
  final double percent; // Percentage of the budget spent
  final Color color; // Color for the timeline
  double todayPercent = 20; // Today's percentage marker

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFont(
          text: startDate,
          fontSize: 12,
        ),
        Expanded(
          child: BudgetProgress(
            color: this.color,
            percent: percent,
            todayPercent: todayPercent,
          ),
        ),
        TextFont(
          text: endDate,
          fontSize: 12,
        ),
      ],
    );
  }
}

/// A widget that displays the progress of the budget.
class BudgetProgress extends StatelessWidget {
  const BudgetProgress({
    Key? key,
    required this.color,
    required this.percent,
    required this.todayPercent,
  }) : super(key: key);

  final Color color; // Color for the progress bar
  final double percent; // Percentage of the budget spent
  final double todayPercent; // Today's percentage marker

  @override
  Widget build(BuildContext context) {
    var percentText = Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.3),
          child: TextFont(
            text: "${percent.toInt()}%",
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: darken(color, 0.5)),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 20),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 20,
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: percent / 100,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors
                            .red), //can change this color to tint the progress bar
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
            )),
        TodayIndicator(
          percent: todayPercent,
        ),
        Container(
            height: 22,
            child: Padding(
                padding: const EdgeInsets.only(top: 4.3),
                child: TextFont(
                  text: "${percent.toInt()}%",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ))),
      ],
    );
  }
}

/// A widget that indicates today's budget progress.
class TodayIndicator extends StatelessWidget {
  const TodayIndicator({Key? key, required this.percent}) : super(key: key);
  final double percent; // Today's percentage marker

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset(percent / 100, 0),
      child: Container(
        child: Container(
          width: 20,
          height: 39,
          child: OverflowBox(
            maxWidth: 500,
            child: SizedBox(
              width: 38,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context).colorScheme.black),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 4, right: 5, left: 5, bottom: 3),
                        child: TextFont(
                          textAlign: TextAlign.center,
                          text: "Today",
                          fontSize: 9,
                          textColor: Theme.of(context).colorScheme.white,
                        ),
                      )),
                  Container(
                    width: 3,
                    height: 21,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(5)),
                        color: Theme.of(context).colorScheme.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
