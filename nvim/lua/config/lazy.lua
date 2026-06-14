local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 1. Bootstrap lazy.nvim with Interactive Error Handling
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- 2. Combined Plugin and Ecosystem Setup
require("lazy").setup({
  spec = {
    -- Core LazyVim framework
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- From File 1: Essential AI Developer tools extra
    -- { import = "lazyvim.plugins.extras.ai.claudecode" },

    -- Your custom local plugin specifications directory (lua/plugins/*)
    { import = "plugins" },
  },

  defaults = {
    -- false means your custom plugins load at startup unless explicitly set to lazy = true inside their specs
    lazy = false,
    -- Recommended: tracks the latest active git commits rather than brittle pinned tags
    version = false,
  },

  install = {
    -- Merged priority order: prioritizes 'ayu', safely cascades to core defaults
    colorscheme = { "ayu", "tokyonight", "habamax" },
  },

  checker = {
    enabled = true, -- Periodically scan for plugin updates in the background
    notify = false, -- From File 2: Keeps background updates quiet so they don't spam your screen
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin", -- Kept commented out from File 2 in case you use native file browsing
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
