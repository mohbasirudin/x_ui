import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

void logs(var message) {
  log(">> [xui] : $message");
}

class Screen {
  static Size _size() {
    var size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    return size;
  }

  static double w() {
    return _size().width;
  }

  static double h() {
    return _size().height;
  }
}
