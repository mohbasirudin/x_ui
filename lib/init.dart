import 'package:bee_ui/helper/helper.dart';
import 'package:flutter/material.dart';

export 'package:bee_ui/helper/helper.dart';

class BeeUi {
  Future<void> initialized({
    Color? primaryColor,
    double? buttonHeight,
    String? fontFamily,
    Color? disabledColor,
  }) async {
    Helper helper = Helper();

    helper.setPrimaryColor(value: primaryColor);
    helper.setButtonHeight(value: buttonHeight);
    helper.setFontFamily(value: fontFamily);
    helper.setDisabledColor(value: disabledColor);
  }
}
