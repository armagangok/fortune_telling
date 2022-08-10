import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/extension/context_extension.dart';
import '../controllers/tab_controller.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.widgetList,
  }) : super(key: key);

  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return expandedItems();
  }

  Widget expandedItems() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetList,
        ),
      );
    });
  }

  Widget get width => Builder(
        builder: (context) {
          return SizedBox(
            width: context.width(0.08),
          );
        },
      );
}

class ExpandedItem extends StatelessWidget {
  const ExpandedItem({
    Key? key,
    required this.text,
    required this.clickedNumber,
    this.iconData,
    required this.onTap,
    required this.tabControler,
  }) : super(key: key);

  final String text;
  final int clickedNumber;
  final IconData? iconData;
  final Function onTap;
  final BaseTabControler tabControler;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () => onTap(),
          child: Obx(
            () {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: clickedNumber == tabControler.getIndex
                            ? Colors.white
                            : null,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      color: clickedNumber == tabControler.getIndex
                          ? const Color.fromARGB(255, 134, 20, 255)
                              .withOpacity(0.5)
                          : Colors.transparent,
                      height: 10,
                      width: 10,
                    ),
                    /*  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 134, 20, 255),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200)),
                        color: clickedNumber == tabControler.getIndex
                            ? const Color.fromARGB(255, 134, 20, 255)
                                .withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width(0.02),
                        vertical: context.width(0.02),
                      ),
                      child: Icon(
                        iconData,
                        size: 30,
                      ),
                    ), */
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
