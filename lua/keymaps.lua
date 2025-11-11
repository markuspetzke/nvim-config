local map = require("utils.utils").map

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local enabled = require("utils.utils").enabled
vim.g.mapleader = " " -- the leader key is the spacebar
local M = {}

vim.keymap.set("i", "jj", "<ESC>", { silent = true }, { desc = 'jj to exit insert mode' })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

if enabled(group, "telescope") then
	map("n", "<leader>ff", "<CMD>Telescope git_files hidden=true<CR>", { desc = "Telescope Find Files" })
	map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
	map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
	map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
	map("n", "<leader>fa", "<CMD>Telescope aerial<CR>")
	map("n", "<leader>fp", "<CMD>Telescope projects<CR>")
end

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
