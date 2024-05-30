
import 'x_ui_platform_interface.dart';

class XUi {
  Future<String?> getPlatformVersion() {
    return XUiPlatform.instance.getPlatformVersion();
  }
}

class XButton{

}