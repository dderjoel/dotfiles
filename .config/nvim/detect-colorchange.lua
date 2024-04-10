-- from https://felix-kling.de/blog/2021/linux-toggle-dark-mode.html

local colorFile = vim.fn.expand('~/.config/nvim/color.vim')
local function reload() 
	vim.cmd("source ".. colorFile)
end

local w = vim.loop.new_fs_event()
local on_change
local function watch_file(fname)
	w:start(fname, {}, vim.schedule_wrap(on_change))
end
on_change = function()
	reload()
	-- Debounce: stop/start.
	w:stop()
	watch_file(colorFile)
end

-- reload vim config when background changes
watch_file(colorFile)
reload()

vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")
