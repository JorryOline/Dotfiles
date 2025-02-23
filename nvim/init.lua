vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)



if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_vfx_mode = "wireframe"
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.g.neovide_cursor_vfx_mode = "ripple"

    vim.g.neovide_refresh_rate = 120
    
    vim.g.neovide_scale_factor = 0.8
	-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.9
vim.g.transparency = 1.0
--vim.g.neovide_background_color = "#0f1117" .. alpha()

    --vim.o.guifont = "JetBrainsMono Nerd Font Mono Bold:h14" -- text below applies for VimScript
vim.o.guifont = "Maple Mono SC NF" -- text below applies for VimScript
vim.g.neovide_fullscreen = false
end
-- 定义显示 fortune 的函数
local function show_fortune_floating()
  if vim.fn.executable("fortune") == 0 then
    vim.notify("未安装 fortune", vim.log.levels.ERROR)
    return
  end

  local output = vim.fn.system("fortune"):gsub("\n$", "")
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_buf_set_lines(buf, 0, -1, true, vim.split(output, "\n"))
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

-- 映射到 <leader>ff
vim.keymap.set("n", "<leader>ff", show_fortune_floating, { desc = "浮动窗口显示 fortune" })
