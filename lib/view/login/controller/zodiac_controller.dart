import '../../../core/constants/fortune_constants.dart';

class ZodiacController {
  ZodiacController._();
  static final instance = ZodiacController._();

  String getZodicaSign(DateTime date) {
    var days = date.day;
    var months = date.month;

    switch (months) {
      case 01:
        return days >= 21 ? FortuneConstanst.kova : FortuneConstanst.oglak;
      case 02:
        return days >= 20 ? FortuneConstanst.balik : FortuneConstanst.kova;
      case 03:
        return days >= 21 ? FortuneConstanst.koc : FortuneConstanst.balik;
      case 04:
        return days >= 21 ? FortuneConstanst.boga : FortuneConstanst.koc;
      case 05:
        return days >= 22 ? FortuneConstanst.ikizler : FortuneConstanst.boga;
      case 06:
        return days >= 22 ? FortuneConstanst.yengec : FortuneConstanst.ikizler;
      case 07:
        return days >= 23 ? FortuneConstanst.aslan : FortuneConstanst.yengec;
      case 08:
        return days >= 23 ? FortuneConstanst.basak : FortuneConstanst.aslan;
      case 09:
        return days >= 24 ? FortuneConstanst.terazi : FortuneConstanst.basak;
      case 10:
        return days >= 24 ? FortuneConstanst.akrep : FortuneConstanst.terazi;
      case 11:
        return days >= 23 ? FortuneConstanst.yay : FortuneConstanst.akrep;
      case 12:
        return days >= 22 ? FortuneConstanst.oglak : FortuneConstanst.yay;
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
