import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? textWidget;
  final double width;
  final double height;

  const CustomAppBar({
    Key? key,
    this.textWidget,
    this.width = double.infinity,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(width, height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: textWidget,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
