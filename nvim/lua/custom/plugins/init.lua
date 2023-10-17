-- Bootstrap "lazy"
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  'mbbill/undotree',

  require("custom.plugins.nvim-tree"),
  require("custom.plugins.lspconfig"),
  require("custom.plugins.autocompletion"),
  require("custom.plugins.tabnine"),
  require("custom.plugins.which-key"),
  require("custom.plugins.gitsigns"),
  require("custom.plugins.colors"),
  -- require("custom.plugins.cokeline"),
  require("custom.plugins.bufferline"),
  require("custom.plugins.lualine"),
  -- require("custom.plugins.indent-blankline")
  require("custom.plugins.comment"),

  -- Fuzzy Finder (files, lsp, etc)
  require("custom.plugins.telescope"),
  require("custom.plugins.treesitter"),
  require("custom.plugins.surround"),
  require("custom.plugins.hop"),

  require("custom.plugins.refactoring"),
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}, {})

