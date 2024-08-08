import 'package:bee_ui/extension/dynamic.dart';
import 'package:bee_ui/helper/func.dart';
import 'package:flutter/services.dart';

class DecimalFormatter extends TextInputFormatter {
  final bool isMinus;

  DecimalFormatter({this.isMinus = false});

  final _value = const TextEditingValue();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    var data = newValue.text;
    var cursorPos = 0;

    if (",".allMatches(data).length > 1) {
      data = oldValue.text;
      _value.copyWith(text: data);
      cursorPos = _value.selection.base.offset;
    } else {
      cursorPos = newValue.selection.base.offset;
    }
    data = isMinus ? "-$data" : data;

    // var listData = data.split(",");
    // if (listData.length > 1) {
    //   data = "${listData[0].toDecimal()},${listData[1]}";
    // } else {
    //   data = listData[0].toDecimal();
    // }
    cursorPos = isMinus ? cursorPos + 1 : cursorPos;

    return TextEditingValue(
      text: data,
      selection: TextSelection.collapsed(offset: cursorPos),
    );
  }
}
