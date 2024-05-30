import 'package:flutter/material.dart';
import 'package:x_ui/view/field/body.dart';
import 'package:x_ui/view/field/helper.dart';

class CTextFieldNumber extends StatefulWidget {
  final String label;
  final String hint;
  final String initialValue;
  final Function(String value) onChange;
  final TextInputType? type;
  final double? fontSize;
  final EdgeInsets? padding;

  const CTextFieldNumber({
    this.label = "",
    this.hint = "",
    this.initialValue = "",
    required this.onChange,
    this.type,
    this.fontSize,
    this.padding,
    super.key,
  });

  @override
  State<CTextFieldNumber> createState() => _CTextFieldNumberState();
}

class _CTextFieldNumberState extends State<CTextFieldNumber> {
  @override
  Widget build(BuildContext context) {
    return TextFieldBody(
      padding: widget.padding,
      label: widget.label,
      child: TextFormField(
        decoration: InputDecoration(
          isCollapsed: true,
          border: HelperTextField.noBorder(),
          disabledBorder: HelperTextField.noBorder(),
          enabledBorder: HelperTextField.noBorder(),
          errorBorder: HelperTextField.noBorder(),
          focusedBorder: HelperTextField.noBorder(),
          focusedErrorBorder: HelperTextField.noBorder(),
        ),
      ),
    );
  }
}
