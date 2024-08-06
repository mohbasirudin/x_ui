import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:flutter/material.dart';

class BeeText extends StatefulWidget {
  final String text;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;

  const BeeText(
    this.text, {
    this.textAlign,
    this.padding,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    super.key,
  });

  @override
  State<BeeText> createState() => _BeeTextState();
}

class _BeeTextState extends State<BeeText> {
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    var text = widget.text;
    var maxLines = widget.maxLines ?? (text.isNotEmpty ? text.length : 1);

    return Text(
      text,
      textAlign: widget.textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: widget.color ?? _helper.getTextColor(),
        fontSize: widget.fontSize ?? _helper.getFontSize(),
        fontWeight: widget.fontWeight,
      ),
    ).padding(widget.padding);
  }
}
