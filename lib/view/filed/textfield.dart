import 'package:bee_ui/extension/number.dart';
import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/formatter/decimal.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/helper/radius.dart';
import 'package:bee_ui/view/others/label_field.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeeTextField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String label;
  final bool isShowBorder;
  final double borderRadius;
  final FocusNode? focusNode;
  final TextInputAction? action;
  final TextInputType? type;
  final Function(String v)? onChanged;
  final String? hint;
  final IconData? sufficIcon;
  final String? sufficText;
  final Function()? onTapSuffic;
  final bool enabled;
  final Color? cursorColor;

  const BeeTextField({
    this.controller,
    this.padding,
    this.label = "",
    this.isShowBorder = true,
    this.borderRadius = 0,
    this.focusNode,
    this.action,
    this.type,
    this.onChanged,
    this.hint,
    this.sufficIcon,
    this.sufficText,
    this.onTapSuffic,
    this.enabled = true,
    this.cursorColor,
    super.key,
  });

  @override
  State<BeeTextField> createState() => _BeeTextFieldState();
}

class _BeeTextFieldState extends State<BeeTextField> {
  final _helper = Helper();
  FocusNode? focusNode;
  var hasFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.focusNode != null) {
      focusNode = widget.focusNode;
    }

    if (focusNode != null) {
      focusNode?.addListener(() {
        hasFocus = focusNode?.hasFocus ?? false;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;

    var label = widget.label;
    var fontSize = _helper.getFontSize();
    var color =
        hasFocus ? _helper.getPrimaryColor() : _helper.getOutlinedColor();
    var hint = "";

    Widget? sufficIcon;
    if (widget.sufficIcon != null) {
      sufficIcon = IconButton(
        onPressed: enabled ? widget.onTapSuffic : null,
        icon: Icon(
          widget.sufficIcon,
          color: color,
        ),
      );
    }
    if (widget.sufficText != null) {
      sufficIcon = IconButton(
        onPressed: enabled ? widget.onTapSuffic : null,
        icon: BeeText(
          widget.sufficText ?? "",
          fontSize: fontSize.scale(0.9),
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
    }

    var isNumber = widget.type == TextInputType.number;
    var formatters = <TextInputFormatter>[];
    if (isNumber) {
      formatters = [
        FilteringTextInputFormatter.allow(RegExp("[0-9,]")),
        DecimalFormatter(),
      ];
      hint = widget.hint ?? "0";
    } else {
      hint = widget.hint ?? "";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CLabelField(
          label,
          hasFocus: hasFocus,
        ),
        TextFormField(
          controller: widget.controller,
          focusNode: focusNode,
          cursorColor: widget.cursorColor ?? _helper.getPrimaryColor(),
          keyboardType: widget.type,
          textInputAction: widget.action,
          style: _textStyle(color: _helper.getTextColor()),
          onChanged: widget.onChanged,
          inputFormatters: formatters,
          enabled: enabled,
          readOnly: !enabled,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: paddingAll(),
            hintText: hint,
            hintStyle: _textStyle(color: _helper.getOutlinedColor()),
            suffixIcon: sufficIcon,
            // suffix: Icon(Icons.add),
            // border
            border: _border(color: _helper.getOutlinedColor()),
            disabledBorder: _border(color: _helper.getDisabledColor()),
            enabledBorder: _border(color: _helper.getOutlinedColor()),
            errorBorder: _border(color: _helper.getErrorColor()),
            focusedBorder: _border(color: _helper.getPrimaryColor()),
            focusedErrorBorder: _border(color: _helper.getErrorColor()),
          ),
        ),
      ],
    ).padding(widget.padding);
  }

  TextStyle _textStyle({
    required Color color,
  }) {
    return TextStyle(color: color, fontSize: _helper.getFontSize());
  }

  OutlineInputBorder? _border({required Color color}) {
    if (!widget.isShowBorder) return null;

    return OutlineInputBorder(
      borderRadius: radiusAll(
        value: widget.borderRadius,
      ),
      borderSide: BorderSide(
        color: focusNode != null ? color : _helper.getOutlinedColor(),
        width: _helper.getOutlinedSize(),
      ),
    );
  }
}
