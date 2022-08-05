import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/extension/context_extension.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../controllers/tab_controller.dart';

class MyTabBar extends StatelessWidget {
  MyTabBar({Key? key}) : super(key: key);

  final TabBarController tabBarController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return expandedItems();
  }

  Widget expandedItems() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              expandedItem(
                "Genel",
                0,
                CupertinoIcons.person_fill,
                () => tabBarController.changeIndex(0),
              ),
              width,
              expandedItem(
                "Aşk",
                1,
                CupertinoIcons.heart_fill,
                () => tabBarController.changeIndex(1),
              ),
              width,
              expandedItem(
                "Sağlık",
                2,
                CupertinoIcons.scissors,
                () => tabBarController.changeIndex(2),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget get width => Builder(
        builder: (context) {
          return SizedBox(
            width: context.width(0.05),
          );
        },
      );

  Widget expandedItem(
    String text,
    int clickedNumber,
    IconData iconData,
    final Function onTap,
  ) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () => onTap(),
          child: Obx(
            () {
              return Column(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color:
                          clickedNumber == tabBarController.currentIndex.value
                              ? Colors.white
                              : null,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 134, 20, 255),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(200)),
                      color:
                          clickedNumber == tabBarController.currentIndex.value
                              ? const Color.fromARGB(255, 134, 20, 255).withOpacity(0.5)
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
                  ),
                  
                ],
              );
            },
          ),
        );
      },
    );
  }
}
