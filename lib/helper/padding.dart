import 'package:flutter/cupertino.dart';

padZero() {
  return EdgeInsets.zero;
}

padLeft(double value) {
  return EdgeInsets.only(left: value);
}

padRight(double value) {
  return EdgeInsets.only(right: value);
}

padTop(double value) {
  return EdgeInsets.only(top: value);
}

padBottom(double value) {
  return EdgeInsets.only(bottom: value);
}

padVertical(double value) {
  return EdgeInsets.symmetric(vertical: value);
}

padHorizontal(double value) {
  return EdgeInsets.symmetric(horizontal: value);
}

padSymmetric({double v = 0, double h = 0}) {
  return EdgeInsets.symmetric(
    vertical: v,
    horizontal: h,
  );
}
