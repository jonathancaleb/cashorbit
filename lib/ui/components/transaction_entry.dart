import 'package:animations/animations.dart';
import 'package:cashorbit/core/utils/colors.dart';
import 'package:cashorbit/core/utils/functions.dart';
import 'package:cashorbit/data/models/transaction_Category.dart';
import 'package:cashorbit/data/models/transaction_model.dart';
import 'package:cashorbit/data/models/transaction_tag.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionEntry extends StatelessWidget {
  TransactionEntry(
      {super.key, required this.openPage, required this.transaction});

  final Widget openPage;
  final Transaction transaction;

  final double fabSize = 50;
  final TransactionCategory category = findCategory("id");

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return openPage;
      },
      onClosed: () {
        print("hello");
      }(),
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: () {
                openContainer();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: [
                    CategoryIcon(category: category, size: 50),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            transaction.title != ""
                                ? TextFont(
                                    text: transaction.title,
                                    fontSize: 20,
                                  )
                                : Container(),
                            transaction.title == "" &&
                                    transaction.tagIDs.isNotEmpty
                                ? TagIcon(
                                    tag: TransactionTag(
                                        title: "test",
                                        id: "test",
                                        categoryID: "id"),
                                    size: 16)
                                : Container(),
                            transaction.title == "" &&
                                    transaction.tagIDs.isEmpty
                                ? TextFont(
                                    text: category.title,
                                    fontSize: 20,
                                  )
                                : Container(),
                            transaction.title == "" && transaction.note != ""
                                ? Container(height: 4)
                                : Container(),
                            transaction.note == ""
                                ? Container()
                                : TextFont(
                                    text: transaction.note,
                                    fontSize: 16,
                                    maxLines: 2,
                                  ),
                            transaction.note == ""
                                ? Container()
                                : Container(height: 4),
                            //TODO loop through all tags relating to this entry
                            transaction.title != "" &&
                                    transaction.tagIDs.isNotEmpty
                                ? TagIcon(
                                    tag: TransactionTag(
                                        title: "test",
                                        id: "test",
                                        categoryID: "id"),
                                    size: 12)
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 5),
                      child: TextFont(
                        text: convertToMoney(transaction.amount),
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.category, required this.size});

  final TransactionCategory category;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: category.color),
      child: Center(
        child: Image(
          image: AssetImage("../assets/icons/categories/${category.icon}"),
          width: size * 0.5,
        ),
      ),
    );
  }
}

class TagIcon extends StatelessWidget {
  const TagIcon({Key? key, required this.tag, required this.size})
      : super(key: key);

  final TransactionTag tag;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Theme.of(context).colorScheme.lightDarkAccentHeavy,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.5 * size / 14,
            right: 10 * size / 14,
            left: 10 * size / 14,
            bottom: 4 * size / 14),
        child: TextFont(
          text: "My Text",
          fontSize: size,
        ),
      ),
    );
  }
}

class DateDivider extends StatelessWidget {
  const DateDivider({
    super.key,
    required this.date,
  });
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.accentColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFont(
          text: DateFormat.MMMMEEEEd('en_US').format(date).toString(),
          fontSize: 15,
        ),
      ),
    );
  }
}
