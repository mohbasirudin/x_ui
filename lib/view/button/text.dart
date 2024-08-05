import 'package:bee_ui/extension/number.dart';
import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class BeeButtonText extends StatefulWidget {
  final String text;
  final bool enabled;
  final Function() onTap;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? disabledColor;
  final EdgeInsets? padding;

  const BeeButtonText(
    this.text, {
    this.enabled = true,
    required this.onTap,
    this.fontWeight,
    this.color,
    this.disabledColor,
    this.padding,
    super.key,
  });

  @override
  State<BeeButtonText> createState() => _BeeButtonTextState();
}

class _BeeButtonTextState extends State<BeeButtonText> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    var enabledColor = widget.color ?? _helper.getPrimaryColor();
    var disabledColor = widget.disabledColor ?? _helper.getDisabledColor();
    var color = enabled ? enabledColor : disabledColor;

    return BeeText(
      widget.text,
      fontWeight: widget.fontWeight ?? FontWeight.w500,

      color: color,
    )
        .onTap(
          enabled ? widget.onTap : null,
        )
        .padding(widget.padding);
  }
}
