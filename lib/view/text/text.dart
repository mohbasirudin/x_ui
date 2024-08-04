import 'package:bee_ui/extension/widget.dart';
import 'package:flutter/material.dart';

class BeeText extends StatefulWidget {
  final String text;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const BeeText(
    this.text, {
    this.textAlign,
    this.padding,
    this.color,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  State<BeeText> createState() => _BeeTextState();
}

class _BeeTextState extends State<BeeText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),
    ).padding(widget.padding);
  }
}
