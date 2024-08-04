//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bee_ui/x_ui_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) bee_ui_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "XUiPlugin");
  x_ui_plugin_register_with_registrar(bee_ui_registrar);
}
