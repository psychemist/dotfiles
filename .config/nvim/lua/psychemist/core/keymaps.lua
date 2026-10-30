-- set [SPACE] as leader/trigger character
vim.g.mapleader = " "

local map = vim.keymap.set

-- enter netrw tree listing from normal mode
map("n", "<leader>vv", vim.cmd.Ex, { desc = "Go to netrw tree from file" })

-- enter command mode with semicolon key
map("n", ";", ":", { desc = "CMD enter command mode" })

-- force quit nvim with 1 instead of !
map("n", "q1", "q!", { desc = "CMD force quit vim without saving" })

-- exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("i", "<C-c>", "<Esc>")

-- move to end of line in visual mode
map("n", "=", "$", { desc = "Go to end of line" })

-- move highlighted code blocks in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
map("n", "xx", '"_x', { desc = "Delete character without copying" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
map("n", "<leader>w", "<C-w><C-w>", { desc = "Move between windows" }) -- move between windows

-- tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use H to move !!"<CR>')
map("n", "<right>", '<cmd>echo "Use L to move !!!"<CR>')
map("n", "<up>", '<cmd>echo "Use K to move !!!"<CR>')
map("n", "<down>", '<cmd>echo "Use J to move !!!"<CR>')

-- runs plenary tests in the current file.
vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- keeps cursor centered when joining lines with J
map("n", "J", "mzJ`z")

-- scroll and search while keeping cursor vertically centered and unfolding folds
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- format paragraph block without losing cursor spot
map("n", "=ap", "ma=ap'a")

-- restart LSP
map("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- paste over selection without overwriting the clipboard
map("x", "<leader>p", [["_dP]])

-- system clipboard yanks
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- delete without yanking
map({ "n", "v" }, "<leader>d", '"_d')

-- nuke Q command
map("n", "Q", "<nop>")

-- tmux windows/sessionizers
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
map("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

-- quickfix navigations
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace word under cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- reload config
map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- TODAY journal key bindings
map("n", "<leader>t", ":Today<CR>", { noremap = true, silent = true, desc = "Open today's note" })

-- CELLULAR AUTOMATON key bindings
map("n", "<leader>cm", function()
	require("cellular-automaton").start_animation("make_it_rain")
end)

map("n", "<leader>cg", function()
	require("cellular-automaton").start_animation("game_of_life")
end)

map("n", "<leader>cs", function()
	require("cellular-automaton").start_animation("slide")
end)

-- start and stop collaborative vim editing sessions
map("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
map("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)
