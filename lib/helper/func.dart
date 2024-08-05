import 'package:flutter/foundation.dart';

void logs({dynamic name, dynamic message}) {
  if (kDebugMode) {
    print("[${name ?? "???"}] => $message");
  }
}
