import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:bee_ui/helper/radius.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class BeeButtonOutlined extends StatefulWidget {
  final String text;
  final Function() onTap;
  final EdgeInsets? padding;
  final double? radius;
  final Color? color;
  final bool enabled;
  final Color? disabledColor;

  const BeeButtonOutlined(
    this.text, {
    required this.onTap,
    this.padding,
    this.radius,
    this.color,
    this.enabled = true,
    this.disabledColor,
    super.key,
  });

  @override
  State<BeeButtonOutlined> createState() => _BeeButtonOutlinedState();
}

class _BeeButtonOutlinedState extends State<BeeButtonOutlined> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    var height = _helper.getButtonHeight();
    var enabledColor = widget.color ?? _helper.getPrimaryColor();
    var disabledColor = widget.disabledColor ?? _helper.getDisabledColor();
    var color = enabled ? enabledColor : disabledColor;

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radiusAll(),
        border: Border.all(
          color: color,
          width: _helper.getOutlinedSize(),
        ),
      ),
      child: BeeText(
        widget.text,
        textAlign: TextAlign.center,
        color: color,
      ).center(),
    )
        .onTapAnimation(
          enabled ? widget.onTap : null,
          height: height,
        )
        .radiusAll(widget.radius)
        .padding(widget.padding);
  }
}
