-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.colorcolumn = "80"

vim.opt.spelllang = { "en_us", "de_de" }
-- require("which-key").config
-- lvim.builtin.treesitter.rainbow.enable = true

if vim.g.neovide then
  -- vim.o.guifont = "VictorMono Nerd Font"
  vim.o.guifont = "Iosevka SS08"
  vim.g.neovide_transparency = 1
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_profiler = true

  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-+>", function()
    change_scale_factor(1.15)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.15)
  end)
end

vim.opt.fillchars = {
  vert = "║",
  horiz = "═",
  horizup = "╩",
  horizdown = "╦",
  vertleft = "╣",
  vertright = "╠",
  verthoriz = "╬",
}
