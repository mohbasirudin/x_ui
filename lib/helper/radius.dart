import 'package:flutter/material.dart';

var _radius =  8.0;

BorderRadius radiusLeft({double? value}) {
  return BorderRadius.horizontal(
    left: Radius.circular(value??_radius),
  );
}

BorderRadius radiusRight({double? value}) {
  return BorderRadius.horizontal(
    right: Radius.circular(value??_radius),
  );
}

BorderRadius radiusTop(double? value) {
  return BorderRadius.vertical(
    top: Radius.circular(value??_radius),
  );
}

BorderRadius radiusBottom({double? value}) {
  return BorderRadius.vertical(
    bottom: Radius.circular(value??_radius),
  );
}

BorderRadius radiusVertical({double? value}) {
  return BorderRadius.vertical(
    top: Radius.circular(value??_radius),
    bottom: Radius.circular(value??_radius),
  );
}

BorderRadius radiusAll({double? value}) {
  return BorderRadius.all(Radius.circular(value??_radius));
}

BorderRadius radiusZero() {
  return BorderRadius.zero;
}

BorderRadius radiusOnly({
  double topLeft = 0,
  double topRight = 0,
  double bottomLeft = 0,
  double bottomRight = 0,
}) {
  return BorderRadius.only(
    topLeft: Radius.circular(topLeft),
    topRight: Radius.circular(topRight),
    bottomLeft: Radius.circular(bottomLeft),
    bottomRight: Radius.circular(bottomRight),
  );
}
