import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:x_ui/helper/const.dart';
import 'package:x_ui/helper/helper.dart';
import 'package:x_ui/view/field/body.dart';
import 'package:x_ui/view/field/helper.dart';

class CTextFieldNumber extends StatefulWidget {
  final String label;
  final String hint;
  final String initialValue;
  final Function(String value) onChange;
  final double? fontSize;
  final EdgeInsets? padding;
  final int? digits;
  final bool readOnly;
  final String? fontFamily;

  const CTextFieldNumber({
    this.label = "",
    this.hint = "",
    this.initialValue = "",
    required this.onChange,
    this.fontSize,
    this.padding,
    this.digits,
    this.readOnly = false,
    this.fontFamily,
    super.key,
  });

  @override
  State<CTextFieldNumber> createState() => _CTextFieldNumberState();
}

class _CTextFieldNumberState extends State<CTextFieldNumber> {
  // final controller = MaskedTextController(mask: "0.000.000.000");
  final controller = TextEditingController();
  CurrencyTextInputFormatter? currencyFormat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // controller.text = widget.initialValue;
    if (widget.initialValue.isNotEmpty) {
      var format = NumberFormat.currency(
        locale: "id",
        symbol: "",
        decimalDigits: widget.digits ?? 0,
      );
      var initialValue = format.format(double.parse(widget.initialValue));
      controller.text = initialValue;
      // controller.text = format.format(widget.initialValue);
    }

    currencyFormat = CurrencyTextInputFormatter.currency(
      decimalDigits: widget.digits ?? 0,
      locale: "id",
      symbol: "",
    );
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
      padding: widget.padding,
      readOnly: widget.readOnly,
      label: widget.label,
      child: TextFormField(
        onChanged: widget.onChange,
        keyboardType: TextInputType.number,
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          currencyFormat!,
        ],
        enabled: !widget.readOnly,
        style: TextStyle(
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize ?? FontSize.medium(),
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

class CurrencyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var value = newValue.text;
    var money = NumberFormat("###,###.###", "id");
    var text = money.format(value);
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }
}
