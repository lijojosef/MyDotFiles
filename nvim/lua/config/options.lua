local opt = vim.opt

-- 1. Leader Keys (Must be defined early)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 2. Line Numbers & Gutters
opt.number = true -- Show absolute line number at current line
opt.relativenumber = true -- Show relative line numbers for easy jumping
opt.signcolumn = "yes" -- Always show sign column (prevents text shifting)

-- 3. Search Behavior
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless search contains an uppercase letter

-- 4. Formatting & Indentation
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Number of spaces for each step of auto-indent
opt.tabstop = 2 -- Number of spaces a Tab symbol stands for
opt.wrap = false -- Disable text wrapping by default

-- 5. Editor Layout & UI Customization
opt.cursorline = true -- Highlight the text line under the cursor
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.splitbelow = true -- Open new horizontal splits below current window
opt.splitright = true -- Open new vertical splits to the right
opt.showmode = false -- Hide default mode text (e.g. -- INSERT --) since statusline handles it
opt.cmdheight = 0 -- Hide command line when not in use for a cleaner look
opt.scrolloff = 8 -- Keep at least 8 lines above/below cursor when scrolling

-- 6. Scrolling & Mouse Adjustments
opt.mousescroll = "ver:1,hor:1" -- Smooth, single-line precision scrolling with trackpads/mice
opt.smoothscroll = true -- Seamlessly scroll wrapped screen lines

-- 7. Persistent History
opt.undofile = true -- Save undo history to a file across Neovim sessions

-- 8. Status & Window UI Elements
opt.laststatus = 3 -- Global statusline across all windows instead of per-split
opt.showtabline = 2 -- Always show the tabs/buffers bar at the top
opt.clipboard = "unnamedplus" -- Sync system clipboard with Neovim

-- Customizing borders and window end markers cleanly
opt.fillchars = {
  eob = " ", -- Hide the default '~' characters at the End Of Buffer
  vert = "│", -- Smooth vertical split line separator character
}
