import 'package:flutter/material.dart';

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
              onTap: onTap != null
                  ? () => onTap!()
                  : () => alternativeOnTap(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
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

  void alternativeOnTap(BuildContext context) => Navigator.pop(context);
}
