#ifndef FLUTTER_PLUGIN_X_UI_PLUGIN_H_
#define FLUTTER_PLUGIN_X_UI_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace x_ui {

class XUiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  XUiPlugin();

  virtual ~XUiPlugin();

  // Disallow copy and assign.
  XUiPlugin(const XUiPlugin&) = delete;
  XUiPlugin& operator=(const XUiPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace x_ui

#endif  // FLUTTER_PLUGIN_X_UI_PLUGIN_H_
