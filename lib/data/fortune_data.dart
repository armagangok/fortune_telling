import '../core/constants/asset_constant.dart';
import '../core/constants/fortune_constant.dart';
import '../feature/models/zodiac_model.dart';

class FortuneData {
  FortuneData._();
  static final instance = FortuneData._();

  static final List<ZodiacModel> zodiacs = [
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
    ZodiacModel(KFortune.yay, KAsset.yay),
  ];
}
