local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Aidenatgt/au_theme.nvim'
  use 'rktjmp/lush.nvim'
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'jiaoshijie/undotree'

  use 'mrcjkb/rustaceanvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
