-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- top level shortcuts
del({ "n" }, "<leader>qq")
del({ "n" }, "<leader>K") -- keywordprg
del({ "n" }, "<leader>L") -- lazyvim
del({ "n" }, "<leader>l") -- lazyvim

-- tabs
del("n", "<leader><tab>l") -- "<cmd>tablast<cr>", { desc = "Last Tab" })
del("n", "<leader><tab>o") -- "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
del("n", "<leader><tab>f") -- "<cmd>tabfirst<cr>", { desc = "First Tab" })
del("n", "<leader><tab><tab>") -- "<cmd>tabnew<cr>", { desc = "New Tab" })
del("n", "<leader><tab>]") -- "<cmd>tabnext<cr>", { desc = "Next Tab" })
del("n", "<leader><tab>d") -- "<cmd>tabclose<cr>", { desc = "Close Tab" })
del("n", "<leader><tab>[") -- "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- floating terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-t>", lazyterm, { desc = "Terminal (Root Dir)" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- signature help
map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help)
map({ "n", "i" }, "<C-d>", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")

-- modern copy & paste
map({ "n", "v", "c" }, "<C-c>", '"+y', { desc = "Copy to clipboard" })
map({ "n", "v", "c" }, "<C-v>", '"+p', { desc = "Paste from clipboard" })
map({ "i" }, "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Copy to clipboard" })
