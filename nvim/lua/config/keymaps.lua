local map = vim.keymap.set

-- jk to escape in insert mode
map("i", "jk", "<Esc>")

-- Repeat previous f, F, t, or T movement
map("n", ";", ";")

-- Paste in visual mode without overwriting the unnamed register
map("v", "p", "P")

-- Redo
map("n", "U", "<C-r>")

-- Clear search highlighting on pressing Esc
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Skip folds (down, up)
map("n", "j", "gj")
map("n", "k", "gk")

-- Save
map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save" })

-- Notifications history
map("n", "<leader>un", function()
  require("notify").history()
end, { desc = "Notification History" })

-- Floating terminal toggle
map({ "n", "t" }, "<leader>tt", "<cmd>FloatermToggle<cr>", { desc = "Toggle Floating Terminal" })

-- Lazygit at the current file's git root using Snacks
map("n", "<leader>gg", function()
  local buf_dir = vim.fn.expand("%:p:h")
  local git_root_cmd = "git -C " .. vim.fn.shellescape(buf_dir) .. " rev-parse --show-toplevel"
  local git_root = vim.fn.systemlist(git_root_cmd)[1]

  if vim.v.shell_error == 0 and git_root then
    Snacks.lazygit({ cwd = git_root })
  else
    Snacks.lazygit()
  end
end, { desc = "Lazygit (file's git root)" })

-- Word wrap toggle
map("n", "<leader>W", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.notify("Wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "Toggle Word Wrap" })

-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
-- vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
