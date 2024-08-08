import 'package:flutter/material.dart';

var _padding = 12.0;

EdgeInsets paddingLeft({double? value}) {
  return EdgeInsets.only(left: value ?? _padding);
}

EdgeInsets paddingRight({double? value}) {
  return EdgeInsets.only(right: value ?? _padding);
}

EdgeInsets paddingTop({double? value}) {
  return EdgeInsets.only(top: value ?? _padding);
}

EdgeInsets paddingBottom({double? value}) {
  return EdgeInsets.only(bottom: value ?? _padding);
}

EdgeInsets paddingSymmetric({
  required double? vertical,
  required double? horizontal,
}) {
  return EdgeInsets.symmetric(
    vertical: vertical ?? _padding,
    horizontal: horizontal ?? _padding,
  );
}

EdgeInsets paddingHorizontal({
  double? value,
}) {
  return EdgeInsets.symmetric(
    horizontal: value ?? _padding,
  );
}

EdgeInsets paddingVertical({
  required double? value,
}) {
  return EdgeInsets.symmetric(
    vertical: value ?? _padding,
  );
}

EdgeInsets paddingAll({double? value}) {
  return EdgeInsets.all(value ?? _padding);
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
