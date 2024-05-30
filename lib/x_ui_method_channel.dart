import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'x_ui_platform_interface.dart';

/// An implementation of [XUiPlatform] that uses method channels.
class MethodChannelXUi extends XUiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('x_ui');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
