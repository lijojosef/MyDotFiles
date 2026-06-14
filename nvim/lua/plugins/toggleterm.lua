return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]], -- Alternative global toggle shortcut
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "curved", -- Gives you clean, modern rounded edges for the floating window
      winblend = 0,
    },
  },
}
