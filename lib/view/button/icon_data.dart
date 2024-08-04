import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:flutter/material.dart';

class BeeButtonIcon extends StatefulWidget {
  final IconData icon;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? radius;
  final EdgeInsets? padding;
  final bool enabled;
  final Function() onTap;

  const BeeButtonIcon(
    this.icon, {
    this.size,
    this.backgroundColor,
    this.iconColor,
    this.radius,
    this.padding,
    this.enabled = true,
    required this.onTap,
    super.key,
  });

  @override
  State<BeeButtonIcon> createState() => _BeeButtonIconState();
}

class _BeeButtonIconState extends State<BeeButtonIcon> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    var size = widget.size ?? _helper.getButtonHeight();
    var backgroundColor = widget.backgroundColor ?? _helper.getPrimaryColor();
    var iconColor = widget.iconColor ?? Colors.white;
    return Container(
      width: size,
      height: size,
      child: Icon(
        widget.icon,
        color: iconColor,
      ),
    )
        .onTapAnimation(
          enabled ? widget.onTap : null,
          height: size,
          width: size,
          color: backgroundColor,
        )
        .radiusAll(widget.radius)
        .padding(widget.padding);
  }
}
