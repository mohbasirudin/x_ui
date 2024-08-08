import 'package:intl/intl.dart';

extension ExtDynamic on dynamic {
  String toCurrency({
    bool showDigits = false,
    String? locale,
    String? symbol,
  }) {
    try {
      num data = 0;
      if (runtimeType == String) data = num.parse(this);

      final format = NumberFormat.currency(
        locale: locale ?? "id",
        decimalDigits: showDigits ? null : 0,
        symbol: symbol,
      );
      return format.format(data);
    } catch (e) {
      return toString();
    }
  }

  String toDecimal({bool showDigits = false}) {
    return toCurrency(showDigits: showDigits, symbol: "");
  }
}
