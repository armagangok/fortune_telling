import 'package:flutter/cupertino.dart';
import 'package:fortune_telling/core/constants/app_color.dart';
import 'package:fortune_telling/core/extension/context_extension.dart';

class FortuneWidget extends StatelessWidget {
  final String fortune;
  final String motto;
  final String planet;
  final String element;

  const FortuneWidget({
    Key? key,
    required this.fortune,
    required this.motto,
    required this.planet,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.height(0.02)),
          child: Row(
            children: [
              planetText,
              SizedBox(width: context.width(0.025)),
              elementText,
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Motto: ",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColor.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(text: motto),
            ],
          ),
        ),
        SizedBox(height: context.height(0.01)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Yorum: ",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColor.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(text: fortune),
            ],
          ),
        ),
      ],
    );
  }

  Row get planetText {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.globe,
          color: AppColor.purple,
        ),
        Text(planet),
      ],
    );
  }

  Row get elementText {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.suit_diamond_fill,
          color: AppColor.purple,
        ),
        Text(element),
      ],
    );
  }
}
