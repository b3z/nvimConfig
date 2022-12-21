local M = {}

function M.setup()
  local config = {
    cmd = {
      'java', -- or '/path/to/java17_or_newer/bin/java'
              -- depends on if `java` is in your $PATH env variable and if it points to the right version.
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      -- '-javaagent:$HOME/.config/nvim/plugins/jdtls/lombok.jar', 
      -- '-javaagent:$HOME/.config/nvim/plugins/jdtls/lombok.jar', 
      -- '-Xbootclasspath/p:$HOME/.config/nvim/plugins/jdtls/lombok.jar',

      '-jar', '/Users/luca/.config/nvim/plugins/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '--jvm-arg=-javaagent:$HOME/.config/nvim/plugins/jdtls/lombok.jar --jvm-arg=-Xbootclasspath/a:$HOME/.config/nvim/plugins/jdtls/lombok.jar',
      '-configuration', '/Users/luca/.config/nvim/plugins/jdtls/config_mac',
      -- '-data', '/path/to/unique/per/project/workspace/folder'
    },
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = 'openjdk 17',
              path = '/usr/local/Cellar/openjdk@17/17.0.4.1_1/bin/java',
            },
          },
        },
      },
    },
  }
  config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  end

  local capabilities = {
    workspace = {
      configuration = true,
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = false,
        },
      },
    },
  }

  config.capabilities = capabilities

  config.on_attach = function(client, bufnr)
    require('jdtls').setup_dap()
    require('jdtls.setup').add_commands()
  end

  local jar_patterns = {
    '/tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    '/tools/vscode-java-test/server/*.jar',
  }

  local bundles = {}
  for _, jar_pattern in ipairs(jar_patterns) do
    print(jar_pattern)
    for _, bundle in ipairs(vim.split(vim.fn.glob(os.getenv('HOME') .. jar_pattern), '\n')) do
      if not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar') then
        table.insert(bundles, bundle)
      end
    end
  end
  local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  config.init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  }

  require('jdtls').start_or_attach(config)
end

return M
