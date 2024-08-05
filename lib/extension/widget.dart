import 'package:flutter/material.dart';

var _radius = 8.0;

extension ExtWidget on Widget {
  GestureDetector onTap(Function()? tap) {
    return GestureDetector(
      onTap: tap,
      child: this,
    );
  }

  Visibility show(bool value) {
    return Visibility(
      visible: value,
      child: this,
    );
  }

  Widget onTapAnimation(
    Function()? tap, {
    Color? color,
    double? height,
    double? width,
  }) {
    return Material(
      color: color,
      child: SizedBox(
        height: height,
        width: width,
        child: InkWell(
          onTap: tap,
          child: Center(
            child: this,
          ),
        ),
      ),
    );
  }

  Center center() {
    return Center(child: this);
  }

  // radius
  ClipRRect radius(BorderRadius? radius) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: this,
    );
  }

  ClipRRect radiusLeft(double? value) {
    return radius(
      BorderRadius.horizontal(
        left: Radius.circular(value ?? _radius),
      ),
    );
  }

  ClipRRect radiusRight(double? value) {
    return radius(
      BorderRadius.horizontal(
        right: Radius.circular(value ?? _radius),
      ),
    );
  }

  ClipRRect radiusTop(double? value) {
    return radius(
      BorderRadius.vertical(
        top: Radius.circular(value ?? _radius),
      ),
    );
  }

  ClipRRect radiusBottom(double? value) {
    return radius(
      BorderRadius.vertical(
        bottom: Radius.circular(value ?? _radius),
      ),
    );
  }

  ClipRRect radiusVertical(double? value) {
    return radius(
      BorderRadius.vertical(
        top: Radius.circular(value ?? _radius),
        bottom: Radius.circular(value ?? _radius),
      ),
    );
  }

  ClipRRect radiusAll(double? value) {
    return radius(
      BorderRadius.all(Radius.circular(value ?? _radius)),
    );
  }

  ClipRRect radiusZero() {
    return radius(BorderRadius.zero);
  }

  ClipRRect radiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return radius(
      BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  // padding
  Padding padding(EdgeInsets? padding) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: this,
    );
  }

  Padding paddingLeft(double value) {
    return padding(EdgeInsets.only(left: value));
  }

  Padding paddingRight(double value) {
    return padding(EdgeInsets.only(right: value));
  }

  Padding paddingTop(double value) {
    return padding(EdgeInsets.only(top: value));
  }

  Padding paddingBottom(double value) {
    return padding(EdgeInsets.only(bottom: value));
  }

  Padding paddingSymmetric({
    required double vertical,
    required double horizontal,
  }) {
    return padding(EdgeInsets.symmetric(
      vertical: vertical,
      horizontal: horizontal,
    ));
  }

  Padding paddingAll(double value) {
    return padding(EdgeInsets.all(value));
  }

  Padding paddingZero() {
    return padding(EdgeInsets.zero);
  }

  Padding paddingOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return padding(EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    ));
  }
}
