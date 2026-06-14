local jdtls = require("jdtls")

-- 1. Paths and Environment Setup
local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local lombok_jar = jdtls_path .. "/lombok.jar"

-- 2. Project Root Detection
-- Finds the root directory based on standard Java build files
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" or root_dir == nil then
  return
end

-- Generate a unique workspace name based on the project directory
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local eclipse_workspace = home .. "/.local/share/eclipse/" .. project_name

-- 3. Dynamically Find Launcher JAR
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
if launcher_jar == "" then
  print("JDTLS Launcher JAR not found!")
end

-- 4. Configuration Setup
local config = {
  cmd = {
    "java",
    "-Declipse.application.org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "-javaagent:" .. lombok_jar,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher_jar,
    "-configuration",
    jdtls_path .. "/config_mac", -- Specific to macOS
    "-data",
    eclipse_workspace,
  },

  root_dir = root_dir,

  settings = {
    java = {
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "sun.*",
          "org.omg.*",
          "com.oracle.*",
        },
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
  },

  init_options = {
    bundles = {},
  },

  -- 5. Mappings and Core LSP Functionality
  on_attach = function(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    -- Core LSP Keymaps (Using native fallback functions)
    opts.desc = "Go to Definition"
    map("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Go to Declaration"
    map("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Go to Implementation"
    map("n", "gi", vim.lsp.buf.implementation, opts)

    opts.desc = "References"
    map("n", "gr", vim.lsp.buf.references, opts)

    opts.desc = "Hover"
    map("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Code Action"
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("v", "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Rename"
    map("n", "<leader>cr", vim.lsp.buf.rename, opts)

    opts.desc = "Format"
    map("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    -- Java-specific Keymaps via nvim-jdtls extension
    opts.desc = "Organize Imports"
    map("n", "<leader>lo", jdtls.organize_imports, opts)

    opts.desc = "Extract Variable"
    map("n", "<leader>lv", jdtls.extract_variable, opts)

    opts.desc = "Extract Constant"
    map("n", "<leader>lc", jdtls.extract_constant, opts)

    opts.desc = "Extract Method"
    map("v", "<leader>lm", function()
      jdtls.extract_method(true)
    end, opts)
  end,
}

-- 6. Boot the Server
jdtls.start_or_attach(config)
