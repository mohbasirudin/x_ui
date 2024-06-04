import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:x_ui/const.dart';
import 'package:x_ui/helper/const.dart';
import 'package:x_ui/helper/helper.dart';
import 'package:x_ui/view/field/body.dart';
import 'package:x_ui/view/field/helper.dart';

class CTextFieldFullscreen extends StatefulWidget {
  final String label;
  final String hint;
  final String initialValue;
  final Function(String value) onChange;
  final TextInputType? type;
  final double? fontSize;
  final EdgeInsets? padding;
  final bool readOnly;
  final String? fontFamily;

  const CTextFieldFullscreen({
    this.label = "",
    this.hint = "",
    this.initialValue = "",
    required this.onChange,
    this.type,
    this.fontSize,
    this.padding,
    this.readOnly = false,
    this.fontFamily,
    super.key,
  });

  @override
  State<CTextFieldFullscreen> createState() => _CTextFieldFullscreenState();
}

class _CTextFieldFullscreenState extends State<CTextFieldFullscreen> {
  final TextEditingController controller = TextEditingController();
  var value = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("== init state ==");
    value = widget.initialValue;
    controller.text = value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBody(
      label: widget.label,
      readOnly: widget.readOnly,
      padding: widget.padding,
      child: GestureDetector(
        onTap: () {
          if (widget.readOnly) return;

          _openDialog(
            context,
            type: widget.type,
            label: widget.label,
          );
        },
        child: Text(
          value.isNotEmpty ? value : widget.hint,
          style: TextStyle(
            color: value.isNotEmpty ? Colors.black : Colors.grey.shade400,
            fontSize: widget.fontSize ?? FontSize.medium(),
            fontFamily: widget.fontFamily,
          ),
        ),
      ),
    );
  }

  void _openDialog(
    BuildContext ctx, {
    TextInputType? type,
    required String label,
  }) async {
    await showDialog(
      context: ctx,
      barrierColor: Colors.white,
      useRootNavigator: true,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              label,
              style: TextStyle(
                fontSize: FontSize.large(),
                fontFamily: widget.fontFamily,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: TextFormField(
              autofocus: true,
              controller: controller,
              maxLines: 999999,
              keyboardType: type,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: FontSize.large(),
                fontFamily: widget.fontFamily,
              ),
              onEditingComplete: () {
                setState(() {
                  value = controller.text;
                  widget.onChange(value);
                });
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                border: HelperTextField.noBorder(),
                disabledBorder: HelperTextField.noBorder(),
                enabledBorder: HelperTextField.noBorder(),
                errorBorder: HelperTextField.noBorder(),
                focusedBorder: HelperTextField.noBorder(),
                focusedErrorBorder: HelperTextField.noBorder(),
              ),
            ),
          ),
        );
      },
    );
  }
}
