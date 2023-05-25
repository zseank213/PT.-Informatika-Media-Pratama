import 'package:dotted_line/dotted_line.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class ExpandableCardWidget extends StatelessWidget {
  final ExpandableController? expandableController;
  final bool isEnableSlidable;
  final int id;
  final String jawaban;
  final String pertanyaan;
  void Function(BuildContext)? onPressedDelete;
  void Function(BuildContext)? onPressedEdit;

  ExpandableCardWidget({
    Key? key,
    required this.expandableController,
    required this.isEnableSlidable,
    required this.id,
    required this.jawaban,
    required this.pertanyaan,
    required this.onPressedDelete,
    required this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      enabled: isEnableSlidable,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: onPressedDelete,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: onPressedEdit,
            backgroundColor: bluePrimary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Column(
        children: [
          ExpandableNotifier(
            child: ScrollOnExpand(
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                child: Column(
                  children: [
                    ExpandablePanel(
                      controller: expandableController,
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DottedLine(
                              dashColor: neutral50,
                            ),
                            AppDimens.verticalSpace6,
                            Html(
                              data: '''$jawaban''',
                            ),
                            AppDimens.verticalSpace6,
                            Align(
                              alignment: Alignment.centerRight,
                              child: SmallButtonBorder(
                                context: context,
                                text: "Detail",
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    routeDetailFAQ,
                                    arguments: DetailFAQParram(id: id),
                                  );
                                },
                              ),
                            ),
                            AppDimens.verticalSpace12,
                          ],
                        ),
                      ),
                      theme: const ExpandableThemeData(
                        iconColor: primary,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: true,
                        // tapBodyToCollapse: true,
                        hasIcon: true,
                      ),
                      header: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          pertanyaan,
                          style: textMedium(color: neutral80, isBold: true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
