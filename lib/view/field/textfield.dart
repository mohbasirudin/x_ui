import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:x_ui/const.dart';
import 'package:x_ui/view/field/body.dart';
import 'package:x_ui/view/field/helper.dart';

class CTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String initialValue;
  final Function(String value) onChange;
  final TextInputType? type;
  final double? fontSize;
  final EdgeInsets? padding;

  const CTextField({
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
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.text = widget.initialValue;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    log("== did change ==");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log("== dispose ==");

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBody(
      label: widget.label,
      padding: widget.padding,
      child: TextFormField(
        keyboardType: widget.type,
        minLines: 1,
        maxLines: 4,
        controller: controller,
        onChanged: widget.onChange,
        style: TextStyle(
          fontSize: widget.fontSize ?? FontSize.medium,
        ),
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
