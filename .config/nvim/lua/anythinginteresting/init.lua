-- Install packer.nvim if not exist.
local packerpath = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(packerpath) then
    vim.fn.system {
        'git',
	'clone',
	'--depth=1',
	'https://github.com/wbthomason/packer.nvim',
	packerpath,
    }
end

require('anythinginteresting.remap')
require('anythinginteresting.set')
