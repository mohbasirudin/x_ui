//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <x_ui/x_ui_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) x_ui_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "XUiPlugin");
  x_ui_plugin_register_with_registrar(x_ui_registrar);
}
