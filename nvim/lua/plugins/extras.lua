return {
  -- 1. Snacks.nvim Optimization
  -- Prevents indexing freezes on massive repos by ignoring untracked files
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          git_status = {
            untracked = false,
          },
        },
      },
    },
  },

  -- 2. Hop.nvim: Motion navigation anywhere on screen instantly
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        function()
          -- Use Hop's correct HintDirection identifiers
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char2({ direction = directions.AFTER_CURSOR })
        end,
        desc = "Hop 2-char",
        mode = { "n", "x" },
      },
      {
        "S",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_words({ direction = directions.AFTER_CURSOR })
        end,
        desc = "Hop Word",
        mode = { "n", "x" },
      },
      {
        "<leader>j",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR })
        end,
        desc = "Hop Line",
        mode = { "n", "x" },
      },
    },
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },

  -- 3. Nvim-Hlslens: Show dynamic search match count and index indicators
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
      require("hlslens").setup()
      local map = vim.keymap.set

      map(
        "n",
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { desc = "Next Match" }
      )
      map(
        "n",
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { desc = "Prev Match" }
      )
      map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { desc = "Search Word Forward" })
      map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { desc = "Search Word Backward" })
    end,
  },

  -- 4. Nvim-Bqf: Modern Quickfix menu structure with instantaneous previews
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf", -- Fixed: Corrected filetype from "af" to "qf" (Quickfix)
    opts = {
      preview = {
        winblend = 0,
      },
    },
  },

  -- 5. Nvim-Ufo: High-performance, advanced buffer folding engine
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Open All Folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Close All Folds",
      },
      {
        "zk",
        function()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "Peek Fold",
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },

  -- 6. Vim-Fugitive: Comprehensive native Git version control integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gwrite", "Gread", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
      { "<leader>gP", "<cmd>Git push<cr>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git log --oneline -20<cr>", desc = "Git Log (Recent 20)" },
      { "<leader>gB", "<cmd>GBrowse<cr>", desc = "Browse on Remote", mode = { "n", "v" } },
    },
  },
}
