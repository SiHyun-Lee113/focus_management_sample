//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_tts/flutter_tts_plugin.h>
#include <win32audio/win32audio_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterTtsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterTtsPlugin"));
  Win32audioPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("Win32audioPluginCApi"));
}
