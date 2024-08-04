import 'dart:ui';

import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/init.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class BeeButtonElevated extends StatefulWidget {
  final String text;
  final EdgeInsets? padding;
  final bool enabled;
  final Function() onTap;
  final Color? color;
  final double? height;
  final double? radius;
  final Color? colorText;
  final Color? disabledColor;

  const BeeButtonElevated(
    this.text, {
    this.padding,
    this.enabled = true,
    required this.onTap,
    this.color,
    this.height,
    this.radius,
    this.colorText,
    this.disabledColor,
    super.key,
  });

  @override
  State<BeeButtonElevated> createState() => _BeeButtonElevatedState();
}

class _BeeButtonElevatedState extends State<BeeButtonElevated> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    var enabledColor = widget.color ?? _helper.getPrimaryColor();
    var disabledColor = widget.disabledColor ?? _helper.getDisabledColor();
    var color = enabled ? enabledColor : disabledColor;

    return BeeText(
      widget.text,
      textAlign: TextAlign.center,
      color: widget.colorText ?? Colors.white,
    )
        .onTapAnimation(
          enabled ? widget.onTap : null,
          color: color,
          height: widget.height ?? _helper.getButtonHeight(),
        )
        .radiusAll(widget.radius)
        .padding(widget.padding);
  }
}
