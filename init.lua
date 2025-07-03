-- init.lua

-- Load lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git', lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('lazy').setup({
	-- LaTeX setting
	{
		'lervag/vimtex', lazy = false,
		build = ':UpdateRemotePlugins',
		ft = 'tex',
		config = function()
			vim.g.vimtex_view_general_viewer = 'zathura'
			vim.g.vimtex_quickfix_mode = 1
			vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
		end
	},
	-- Theme gruvbox
	{ "morhetz/gruvbox", lazy = false,
	config = function() vim.cmd.colorscheme("gruvbox") end},
	-- Fast comment
	{ "numToStr/Comment.nvim", lazy = false},
	-- Rainbow delimiters
	{ "HiPhish/rainbow-delimiters.nvim", lazy = false },
})

-- global options
-- clipboard
vim.opt.clipboard:append('unnamedplus') -- Sync with OS clipboard
vim.opt.clipboard:append('unnamed') -- Also sync with default register
-- python setting
-- Autocmd for Python files (fixed syntax and error handling)
vim.api.nvim_create_autocmd({'BufRead','BufNewfile'}, {
pattern = "*.py",
callback = function()
vim.g.python_host_prog = 'python3'
end})
-- Comment setting
require('Comment').setup()
-- other regular setting
vim.opt.syntax = 'on'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.wo.number = true
vim.wo.relativenumber = true

-- keymaps
-- leader key
vim.g.mapleader = ','
-- insert mode
vim.keymap.set('i','jk','<Esc>')
-- command mode
vim.keymap.set('c','jk','<Esc>')
-- terminal mode
vim.keymap.set('t','jk','exit<CR>')
-- visual mode
vim.keymap.set('v','jk','<Esc>')
vim.keymap.set('v','j','gj')
vim.keymap.set('v','k','gk')
vim.keymap.set('v','de','$')
vim.keymap.set('v','ds','^')
vim.keymap.set('v','<leader>f','<C-f>')
vim.keymap.set('v','<leader>b','<C-b>')
-- normal mode
vim.keymap.set('n','j','gj')
vim.keymap.set('n','k','gk')
vim.keymap.set('n','de','$')
vim.keymap.set('n','ds','^')
vim.keymap.set('n','<leader>f','*')
vim.keymap.set('n','<leader>b','#')
vim.keymap.set('n','nh',':nohl<CR>')
vim.keymap.set('n','<leader>f','<C-f>')
vim.keymap.set('n','<leader>b','<C-b>')
vim.keymap.set('n','dw',':w<CR>')
vim.keymap.set('n','q',':q<CR>')
vim.keymap.set('n','bn',':bn<CR>')
vim.keymap.set('n','bp',':bp<CR>')
vim.keymap.set('n','bd',':bd<CR>')
vim.keymap.set('n',';e',':e ')
vim.keymap.set('n','<leader>w','<C-w>w')
vim.keymap.set('n','<leader>r','<C-r>')
vim.keymap.set('n','<leader>s',':%s/')
vim.keymap.set('n','<leader>o',':only<CR>')
vim.keymap.set('n','<leader>t',':terminal<CR>')
vim.keymap.set('n',';;',':')
vim.keymap.set('n', '<leader>ll', ':VimtexCompile<CR>', { desc = 'Compile LaTeX' })
vim.keymap.set('n', '<leader>lv', ':VimtexView<CR>', { desc = 'View PDF' })
vim.keymap.set('n', '<leader>le', ':VimtexErrorNext<CR>', { desc = 'Next error' })
