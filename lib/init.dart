import 'package:bee_ui/helper/helper.dart';
import 'package:flutter/material.dart';

export 'package:bee_ui/helper/helper.dart';

class BeeUi {
  Future<void> initialized({
    Color? primaryColor,
    double? buttonHeight,
    String? fontFamily,
    Color? disabledColor,
    double? outlinedSize,
    double? fontSize,
    Color? outlinedColor,
    Color? errorColor,
    Color? textColor,
  }) async {
    Helper helper = Helper();

    helper.setPrimaryColor(value: primaryColor);
    helper.setButtonHeight(value: buttonHeight);
    helper.setFontFamily(value: fontFamily);
    helper.setDisabledColor(value: disabledColor);
    helper.setOutlinedSize(value: outlinedSize);
    helper.setFontSize(value: fontSize);
    helper.setOutlinedColor(value: outlinedColor);
    helper.setErrorColor(value: errorColor);
    helper.setTextColor(value: textColor);
  }
}
