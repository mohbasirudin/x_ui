import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'x_ui_method_channel.dart';

abstract class XUiPlatform extends PlatformInterface {
  /// Constructs a XUiPlatform.
  XUiPlatform() : super(token: _token);

  static final Object _token = Object();

  static XUiPlatform _instance = MethodChannelXUi();

  /// The default instance of [XUiPlatform] to use.
  ///
  /// Defaults to [MethodChannelXUi].
  static XUiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [XUiPlatform] when
  /// they register themselves.
  static set instance(XUiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
