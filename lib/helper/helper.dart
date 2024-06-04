import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:x_ui/helper/ext_num.dart';

void logs(var message) {
  log(">> [x_ui] : $message");
}

class Screen {
  static Size _size() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  static double _width() {
    return isPortrait() ? width() : (width() * 0.75);
  }

  static orientation() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .orientation;
  }

  static double w() {
    return _size().width;
  }

  static double h() {
    return _size().height;
  }
}

bool isPortrait() {
  return Screen.orientation() == Orientation.portrait;
}

double width() => Screen.w();

double height() => Screen.h();

double padding() {
  var value = (3).from(Screen._width());
  logs("padding: $value");
  return value;
}

double buttonHeight() {
  var value = 10.from(Screen._width());
  logs("button height: $value");
  return value;
}

class FontSize {
  static double _size(double v) {
    var value = Screen._width();
    return v.from(value);
  }

  static double small() {
    return _size(3);
  }

  static double medium() {
    return _size(4);
  }

  static double large() {
    return _size(5);
  }
}
