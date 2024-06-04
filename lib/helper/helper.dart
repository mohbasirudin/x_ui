import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:x_ui/helper/ext_num.dart';

void logs(var message) {
  log(">> [xui] : $message");
}

class Screen {
  static Size _size() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
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

class XFontSize {
  static double medium() {
    var value = isPortrait() ? width() : (width()*0.75);
    return 4.from(value);
  }
}
