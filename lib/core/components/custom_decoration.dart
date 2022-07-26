import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/asset_constant.dart';

class AppDecoration {
  AppDecoration._();

  static InputDecoration decoration({String? hinttext, double? height}) {
    return InputDecoration(
      contentPadding:
          EdgeInsets.only(top: height ?? 0) + EdgeInsets.only(left: 20),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.purple),
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide(color: AppColor.purple),
      ),
      hintText: hinttext,
    );
  }

  static BoxDecoration get scaffoldDecoration {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(KAsset.backgroundImage),
        fit: BoxFit.fill,
      ),
    );
  }

  static BorderRadius border({double? radius}) =>
      BorderRadius.all(Radius.circular(radius ?? 90));
}
