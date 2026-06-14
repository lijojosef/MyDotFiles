return {
  -- 1. Bufferline: Top tab bar configuration for tracking open files
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        truncate_names = true,
        tab_size = 12,
        max_name_length = 18,
      },
    },
  },

  -- 2. Disable LazyVim's default vertical indent guides
  { "nvim-mini/mini.indentscope", enabled = false },

  -- 3. Lualine: Ultra-clean, minimal information bar at the bottom
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
        globalstatus = true, -- Singular global statusline across all window splits
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          { "filename", path = 1 }, -- Displays relative pathing instead of just the filename
        },
        lualine_x = {
          { "diagnostics" },
          { "branch", icon = "" }, -- Displays git branch without the bulky default icon
          { "location" },
        },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- 4. Noice: Keep UI messages, search overlays, and command targets flat at the bottom
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true, -- Moves search bar input overlay to bottom status line
        command_palette = false, -- Stops command lines from popping up in a center modal window
        long_message_to_split = true, -- Shunts long informational logs into a split buffer automatically
      },
      cmdline = {
        view = "cmdline", -- Forces traditional layout behavior for typing commands at the bottom
      },
      lsp = {
        progress = { enabled = true },
      },
    },
  },
}
