import 'package:flutter/material.dart';
import 'package:fortune_telling/view/zodiac_signs/zodiac_signs_view.dart';

class ZodiacDetailView extends StatelessWidget {
  const ZodiacDetailView({
    Key? key,
    required this.zodiacModel,
  }) : super(key: key);

  final ZodiacModel zodiacModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(zodiacModel.zodiacName),
      ),
    );
  }
}
