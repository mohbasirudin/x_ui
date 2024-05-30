import 'package:flutter_test/flutter_test.dart';
import 'package:x_ui/x_ui.dart';
import 'package:x_ui/x_ui_platform_interface.dart';
import 'package:x_ui/x_ui_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockXUiPlatform
    with MockPlatformInterfaceMixin
    implements XUiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final XUiPlatform initialPlatform = XUiPlatform.instance;

  test('$MethodChannelXUi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelXUi>());
  });

  test('getPlatformVersion', () async {
    XUi xUiPlugin = XUi();
    MockXUiPlatform fakePlatform = MockXUiPlatform();
    XUiPlatform.instance = fakePlatform;

    expect(await xUiPlugin.getPlatformVersion(), '42');
  });
}
