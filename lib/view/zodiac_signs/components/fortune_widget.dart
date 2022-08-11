import 'package:flutter/cupertino.dart';

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
        Row(
          children: [
            planetText,
            elementText,
          ],
        ),
        Text(motto),
        Text(fortune),
      ],
    );
  }

  Row get planetText {
    return Row(
      children: [
        const Icon(CupertinoIcons.dot_square),
        Text(planet),
      ],
    );
  }

  Row get elementText {
    return Row(
      children: [
        const Icon(CupertinoIcons.dot_square),
        Text(element),
      ],
    );
  }
}
