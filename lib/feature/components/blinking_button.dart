import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';
import 'package:fortune_telling/feature/components/custom_decoration.dart';
import '../../core/extension/context_extension.dart';

class MyBlinkingButton extends StatefulWidget {
  const MyBlinkingButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final Function onTap;
  final String text;

  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(milliseconds: 1500),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child: GestureDetector(
          onTap: () => widget.onTap(),
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
                  child: Center(
                      child: AutoSizeText(
                    widget.text,
                    maxLines: 1,
                    style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  )),
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
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
