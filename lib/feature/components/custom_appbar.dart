import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.enableBackButton = true,
    this.height = kToolbarHeight,
    this.onTap,
  }) : super(key: key);

  final Widget? title;
  final bool enableBackButton;
  final double? height;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: enableBackButton
          ? GestureDetector(
              onTap: onTap != null ? () => onTap!() : () => alternativeOnTap,
              child: const Icon(CupertinoIcons.back),
            )
          : const SizedBox(),
      title: Center(child: title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.abc,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

  void get alternativeOnTap => Get.back();
}
