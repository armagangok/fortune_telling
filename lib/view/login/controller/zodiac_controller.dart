import '../../../core/constants/asset_constant.dart';
import '../../../core/constants/fortune_constant.dart';

class ZodiacController {
  ZodiacController._();
  static final instance = ZodiacController._();

  String getZodicaSign(DateTime date) {
    var days = date.day;
    var months = date.month;

    switch (months) {
      case 01:
        return days >= 21 ? KFortune.kova : KFortune.oglak;
      case 02:
        return days >= 20 ? KFortune.balik : KFortune.kova;
      case 03:
        return days >= 21 ? KFortune.koc : KFortune.balik;
      case 04:
        return days >= 21 ? KFortune.boga : KFortune.koc;
      case 05:
        return days >= 22 ? KFortune.ikizler : KFortune.boga;
      case 06:
        return days >= 22 ? KFortune.yengec : KFortune.ikizler;
      case 07:
        return days >= 23 ? KFortune.aslan : KFortune.yengec;
      case 08:
        return days >= 23 ? KFortune.basak : KFortune.aslan;
      case 09:
        return days >= 24 ? KFortune.terazi : KFortune.basak;
      case 10:
        return days >= 24 ? KFortune.akrep : KFortune.terazi;
      case 11:
        return days >= 23 ? KFortune.yay : KFortune.akrep;
      case 12:
        return days >= 22 ? KFortune.oglak : KFortune.yay;
      default:
        return "";
    }
  }

  String getSignImagePath(String zodiacSign) {
    switch (zodiacSign) {
      case "Yay":
        return KAsset.yay;

      case "Aslan":
        return KAsset.aslan;

      case "Başak":
        return KAsset.basak;

      case "Yengeç":
        return KAsset.aslan;

      case "Kova":
        return KAsset.kova;

      case "Koç":
        return KAsset.koc;

      case "Akrep":
        return KAsset.akrep;

      case "Boğa":
        return KAsset.boga;

      case "Balık":
        return KAsset.balik;

      case "İkizler":
        return KAsset.ikizler;

      case "Terazi":
        return KAsset.terazi;

      case "Oğlak":
        return KAsset.oglak;

      default:
        return "";
    }
  }
}

// if (months == 01) {
//     if (days >= 21) {
//       return "Aquarius";
//     } else {
//       return "Capricorn";
//     }
//   } else if (months == 02) {
//     if (days >= 20) {
//       return "Picis";
//     } else {
//       return "Aquarius";
//     }
//   } else if (months == 03) {
//     if (days >= 21) {
//       return "Aries";
//     } else {
//       return "Pisces";
//     }
//   } else if (months == 04) {
//     if (days >= 21) {
//       return "Taurus";
//     } else {
//       return "Aries";
//     }
//   } else if (months == 05) {
//     if (days >= 22) {
//       return "Gemini";
//     } else {
//       return "Taurus";
//     }
//   } else if (months == 06) {
//     if (days >= 22) {
//       return "Cancer";
//     } else {
//       return "Gemini";
//     }
//   } else if (months == 07) {
//     if (days >= 23) {
//       return "Leo";
//     } else {
//       return "Cancer";
//     }
//   } else if (months == 08) {
//     if (days >= 23) {
//       return "Virgo";
//     } else {
//       return "Leo";
//     }
//   } else if (months == 09) {
//     if (days >= 24) {
//       return "Libra";
//     } else {
//       return "Virgo";
//     }
//   } else if (months == 10) {
//     if (days >= 24) {
//       return "Scorpio";
//     } else {
//       return "Libra";
//     }
//   } else if (months == 11) {
//     if (days >= 23) {
//       return "Sagittarius";
//     } else {
//       return "Scorpio";
//     }
//   } else if (months == 12) {
//     if (days >= 22) {
//       return "Capricorn";
//     } else {
//       return "Sagittarius";
//     }
//   }
//   return "";
// }
