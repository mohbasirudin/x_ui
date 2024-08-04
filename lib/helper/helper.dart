import 'package:flutter/material.dart';

class Helper {
  static double? _buttonHeight;
  static Color? _primaryColor;
  static Color? _disabledColor;
  static String? _fontFamily;
  static double? _outlinedSize;

  void setPrimaryColor({Color? value}) {
    _primaryColor = value;
  }

  Color getPrimaryColor() {
    return _primaryColor ?? Colors.green;
  }

  void setDisabledColor({Color? value}) {
    _disabledColor = value;
  }

  Color getDisabledColor() {
    return _disabledColor ?? Colors.blueGrey;
  }

  void setButtonHeight({double? value}) {
    _buttonHeight = value;
  }

  double getButtonHeight() {
    return _buttonHeight ?? 48;
  }

  void setFontFamily({String? value}) {
    _fontFamily = value;
  }

  String getFontFamily() {
    return _fontFamily ?? "";
  }

  void setOutlinedSize({double? value}) {
    _outlinedSize = value;
  }

  double getOutlinedSize() {
    return _outlinedSize ?? 1.2;
  }
}
