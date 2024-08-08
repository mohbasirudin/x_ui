import 'package:flutter/material.dart';

class Helper {
  static double? _buttonHeight;
  static Color? _primaryColor;
  static Color? _disabledColor;
  static String? _fontFamily;
  static double? _outlinedSize;
  static double? _fontSize;
  static Color? _outlinedColor;
  static Color? _errorColor;
  static Color? _textColor;
  static double? _radius;
  static double? _padding;

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
    return _disabledColor ?? Colors.blueGrey.shade200;
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

  void setFontSize({double? value}) {
    _fontSize = value;
  }

  double getFontSize() {
    return _fontSize ?? 14;
  }

  void setOutlinedColor({Color? value}) {
    _outlinedColor = value;
  }

  Color getOutlinedColor() {
    return _outlinedColor ?? Colors.blueGrey;
  }

  void setErrorColor({Color? value}) {
    _errorColor = value;
  }

  Color getErrorColor() {
    return _errorColor ?? Colors.red;
  }

  void setTextColor({Color? value}) {
    _textColor = value;
  }

  Color getTextColor() {
    return _textColor ?? Colors.black87;
  }

  void setRadius({double? value}) {
    _radius = value;
  }

  double getRadius() {
    return _radius ?? 8;
  }

  void setPadding({double? value}) {
    _padding = value;
  }

  double getPadding() {
    return _padding ?? 12;
  }
}
