import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';
import 'package:fortune_telling/core/extension/context_extension.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton(
      {Key? key, required this.onTap, required this.text})
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
            border: Border.all(color: AppColor.purple, width: 1.7),
            borderRadius: const BorderRadius.all(Radius.circular(13.0)),
          ),
          height: context.height(0.1),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Center(child: Text(text)),
              ),
              Padding(
                padding: EdgeInsets.only(right: context.width(0.025)),
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(CupertinoIcons.forward)),
              )
            ],
          )),
    );
    ;
  }
}
