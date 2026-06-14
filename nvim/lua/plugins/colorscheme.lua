return {
  -- 1. Ayu Colorscheme Setup & Customizations
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = true, -- Enables the mirage variant
        overrides = {
          -- Complete Interface Transparency
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          FoldColumn = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          CursorLineNr = { bg = "NONE" },
          StatusLine = { bg = "NONE" },
          StatusLineNC = { bg = "NONE" },
          TabLineFill = { bg = "NONE" },

          -- Borders & Layout Separators
          WinSeparator = { bg = "NONE", fg = "#3b4261" },
          FloatBorder = { bg = "NONE", fg = "#565f89" },

          -- Italicized & Colored Comments
          Comment = { italic = true, fg = "#6c7a8b" },
          SpecialComment = { italic = true, fg = "#6c7a8b" },
          ["@comment"] = { italic = true, fg = "#6c7a8b" },
          ["@comment.documentation"] = { italic = true, fg = "#6c7a8b" },
          ["@lsp.type.comment"] = { italic = true, fg = "#6c7a8b" },

          -- Elegant Italics for Syntax Keywords
          ["keyword"] = { italic = true },
          ["keyword.function"] = { italic = true },
          ["@keyword.return"] = { italic = true },
          ["@keyword.operator"] = { italic = true },
          ["@attribute"] = { italic = true },
          ["@type.qualifier"] = { italic = true },
        },
      }) -- Fixed: Correctly closed both the table and the function parameters

      -- Load the colorscheme directly
      vim.cmd.colorscheme("ayu-mirage")

      -- Enforce highlights automatically if the colorscheme dynamically shifts
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#6c7a8b" })
          vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
          vim.api.nvim_set_hl(0, "@comment.documentation", { italic = true, fg = "#6c7a8b" })
          vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "Comment" })
          vim.api.nvim_set_hl(0, "@keyword", { italic = true })
          vim.api.nvim_set_hl(0, "@keyword.function", { italic = true })
          vim.api.nvim_set_hl(0, "@keyword.return", { italic = true })
          vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", fg = "#3b4261" })
          vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
        end,
      })
    end,
  },

  -- 2. Configure LazyVim core to use the newly loaded theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-mirage",
    },
  },

  -- 3. Notification Styling Customizations
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      stages = "fade", -- Smooth fade with zero layout shifting animation jitter
    },
  },
}
