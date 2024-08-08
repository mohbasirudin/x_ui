import 'package:bee_ui/extension/number.dart';
import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class CLabelField extends StatefulWidget {
  final String label;
  final bool hasFocus;

  const CLabelField(
    this.label, {
    this.hasFocus = false,
    super.key,
  });

  @override
  State<CLabelField> createState() => _CLabelFieldState();
}

class _CLabelFieldState extends State<CLabelField> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    return BeeText(
      widget.label,
      fontSize: _helper.getFontSize().scale(0.85),
      fontWeight: FontWeight.w500,
      padding: paddingBottom(value: 4),
      color: widget.hasFocus
          ? _helper.getPrimaryColor()
          : _helper.getTextColor(),
    ).show(
      widget.label.isNotEmpty,
    );
  }
}
