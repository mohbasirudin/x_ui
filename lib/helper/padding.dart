import 'package:flutter/material.dart';

EdgeInsets paddingLeft(double value) {
  return EdgeInsets.only(left: value);
}

EdgeInsets paddingRight(double value) {
  return EdgeInsets.only(right: value);
}

EdgeInsets paddingTop(double value) {
  return EdgeInsets.only(top: value);
}

EdgeInsets paddingBottom(double value) {
  return EdgeInsets.only(bottom: value);
}

EdgeInsets paddingSymmetric({
  required double vertical,
  required double horizontal,
}) {
  return EdgeInsets.symmetric(
    vertical: vertical,
    horizontal: horizontal,
  );
}

EdgeInsets paddingAll(double value) {
  return EdgeInsets.all(value);
}

EdgeInsets paddingZero() {
  return EdgeInsets.zero;
}

EdgeInsets paddingOnly({
  double? left,
  double? right,
  double? top,
  double? bottom,
}) {
  return EdgeInsets.only(
    left: left ?? 0,
    right: right ?? 0,
    top: top ?? 0,
    bottom: bottom ?? 0,
  );
}
