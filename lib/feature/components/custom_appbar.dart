import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? textWidget;
//   final double width;
//   final double height;
//   final Function? onTap;

//   const CustomAppBar({
//     Key? key,
//     this.textWidget,
//     this.width = double.infinity,
//     this.height = kToolbarHeight,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Size get preferredSize => Size(width, height);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: textWidget,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       leading: GestureDetector(
//           child: const Icon(CupertinoIcons.back),
//           onTap: () => onTap != null
//               ? onTap!()
//               : () {
//                   Get.back();
//                 }),
//     );
//   }
// }

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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: enableBackButton
            ? GestureDetector(
                onTap:
                    onTap != null ? () => onTap!() : () => alternativeOnTap(),
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

  void alternativeOnTap() => Get.back();
}
