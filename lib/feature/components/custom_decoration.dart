import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';

import '../../core/constants/asset_constant.dart';

class CustomDecoration {
  CustomDecoration._();

  static InputDecoration decoration(String hinttext) {
    return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.purple),
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
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
}
