import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';
import '../../core/navigation/app_pages.dart';

class ZodiacSignsView extends StatelessWidget {
  ZodiacSignsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GridView.builder(
          padding: context.all(0.025),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
          ),
          itemCount: zodiacs.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.ZODIAC_DETAIL,
                      arguments: zodiacs[index],
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        zodiacs[index].path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  zodiacs[index].zodiacName,
                  style: context.textTheme.headline5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<ZodiacModel> zodiacs = [
    ZodiacModel("Yay", KAsset.yay),
    ZodiacModel("Aslan", KAsset.aslan),
    ZodiacModel("Akrep", KAsset.akrep),
    ZodiacModel("İkizler", KAsset.ikizler),
    ZodiacModel("Boğa", KAsset.boga),
    ZodiacModel("Balık", KAsset.balik),
    ZodiacModel("Koç", KAsset.koc),
    ZodiacModel("Kova", KAsset.kova),
    ZodiacModel("oğlak", KAsset.oglak),
    ZodiacModel("Terazi", KAsset.terazi),
    ZodiacModel("Başak", KAsset.basak),
    ZodiacModel("Yengeç", KAsset.yengec),
  ];
}

class ZodiacModel {
  final String zodiacName;
  final String path;

  ZodiacModel(this.zodiacName, this.path);
}
