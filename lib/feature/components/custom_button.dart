import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/extension/context_extension.dart';
import 'custom_decoration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.purple.withOpacity(0.4),
          border: Border.all(
            color: AppColor.purple,
          ),
          borderRadius: AppDecoration.border(),
        ),
        height: context.height(0.089),
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Center(child: Text(text)),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.normalWidth),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.forward),
              ),
            )
          ],
        ),
      ),
    );
  }
}
