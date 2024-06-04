import 'package:flutter/cupertino.dart';
import 'package:bee_ui/helper/helper.dart';

padZero() {
  return EdgeInsets.zero;
}

padAll({double? v}){
  return EdgeInsets.all(v??padding());
}

padLeft({double? v}) {
  return EdgeInsets.only(left: v??padding());
}

padRight({double? v}) {
  return EdgeInsets.only(right: v??padding());
}

padTop({double? v}) {
  return EdgeInsets.only(top: v??padding());
}

padBottom({double? v}) {
  return EdgeInsets.only(bottom: v??padding());
}

padVertical({double? v}) {
  return EdgeInsets.symmetric(vertical: v??padding());
}

padHorizontal({double? v}) {
  return EdgeInsets.symmetric(horizontal: v??padding());
}

padSymmetric({double v = 0, double h = 0}) {
  return EdgeInsets.symmetric(
    vertical: v,
    horizontal: h,
  );
}
