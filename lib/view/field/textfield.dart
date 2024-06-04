import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:x_ui/const.dart';
import 'package:x_ui/helper/colors.dart';
import 'package:x_ui/helper/const.dart';
import 'package:x_ui/helper/helper.dart';
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
  final bool readOnly;
  final bool autoFocus;
  final String? fontFamily;

  const CTextField({
    this.label = "",
    this.hint = "",
    this.initialValue = "",
    required this.onChange,
    this.type,
    this.fontSize,
    this.padding,
    this.readOnly = false,
    this.autoFocus = false,
    this.fontFamily,
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
      readOnly: widget.readOnly,
      child: TextFormField(
        keyboardType: widget.type,
        minLines: 1,
        maxLines: 4,
        controller: controller,
        onChanged: widget.onChange,
        autofocus: widget.autoFocus,
        style: TextStyle(
          fontSize: widget.fontSize ?? FontSize.medium(),
          fontFamily: widget.fontFamily,
          fontWeight: FontWeight.w400,
        ),
        enabled: !widget.readOnly,
        decoration: InputDecoration(
          hintText: widget.hint,
          isCollapsed: true,
          hintStyle: TextStyle(
            fontSize: widget.fontSize ?? FontSize.medium(),
            color: XColors.disabled,
            fontWeight: FontWeight.w400,
          ),
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
