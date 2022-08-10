import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/fortune_constant.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';

class ZodiacSignsView extends StatefulWidget {
  const ZodiacSignsView({Key? key}) : super(key: key);

  @override
  State<ZodiacSignsView> createState() => _ZodiacSignsViewState();
}

class _ZodiacSignsViewState extends State<ZodiacSignsView> {
  String title = "yay";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SizedBox(
          width: context.width(1),
          height: context.height(0.16),
          child: RotatedBox(
              quarterTurns: 1,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 0),
                useMagnifier: true,
                magnification: 1.3,
                // diameterRatio: 20,
                offAxisFraction: 0.2,
                itemExtent: context.width(0.2),
                onSelectedItemChanged: (value) {
                  zodiacs[value].zodiacName;

                  setState(() {
                    title = zodiacs[value].zodiacName;
                  });
                },
                children: zodiacs.map(
                  (item) {
                    return Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              item.path,
                              scale: 2.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              )),
        ),
      ),
    );
  }

  final List<ZodiacModel> zodiacs = [
    ZodiacModel(KFortune.yay, KAsset.yay),
    ZodiacModel(KFortune.aslan, KAsset.aslan),
    ZodiacModel(KFortune.akrep, KAsset.akrep),
    ZodiacModel(KFortune.ikizler, KAsset.ikizler),
    ZodiacModel(KFortune.boga, KAsset.boga),
    ZodiacModel(KFortune.balik, KAsset.balik),
    ZodiacModel(KFortune.koc, KAsset.koc),
    ZodiacModel(KFortune.kova, KAsset.kova),
    ZodiacModel(KFortune.oglak, KAsset.oglak),
    ZodiacModel(KFortune.terazi, KAsset.terazi),
    ZodiacModel(KFortune.basak, KAsset.basak),
    ZodiacModel(KFortune.yengec, KAsset.yengec),
  ];
}

class ZodiacModel {
  final String zodiacName;
  final String path;

  ZodiacModel(this.zodiacName, this.path);
}
