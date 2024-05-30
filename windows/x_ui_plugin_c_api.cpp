#include "include/x_ui/x_ui_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "x_ui_plugin.h"

void XUiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  x_ui::XUiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
