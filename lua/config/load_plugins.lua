require("flutter-tools").setup({
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = false,
    },
  },
})

local dap = require("dap")

dap.set_log_level("TRACE")

dap.adapters.dart = {
  type = "executable",
  command = "dart",
  args = { "debug_adapter" },
}
dap.adapters.flutter = {
  type = "executable",
  command = "flutter",
  args = { "debug_adapter" },
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/Users/jose/Low_Level/flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/Users/jose/Low_Level/flutter/bin/flutter", -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
    cwd = "${workspaceFolder}",
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/Users/jose/Low_Level/flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/Users/jose/Low_Level/flutter/bin/flutter", -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
    cwd = "${workspaceFolder}",
  },
}
