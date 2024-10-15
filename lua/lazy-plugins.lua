-- :NOTE:
--  lazy-plugins.lua

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs', -- adds ( ) { } automatically when relevant
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  require 'kickstart.plugins.which-key', -- shows keys to press after pressing a key
  require 'kickstart.plugins.fuzzy-finder',
  require 'kickstart.plugins.venv-selector', -- plugin for selecting virtual environments for python
  require 'kickstart.plugins.lsp-config', -- language server configuration
  require 'kickstart.plugins.autoformat', -- autoformatting
  require 'kickstart.plugins.vim-cmp-config', -- autocomplete
  require 'kickstart.plugins.theme-config', -- theme for the editor configured here
  require 'kickstart.plugins.mini-config', -- library of lua modules to improve Neovim
  require 'kickstart.plugins.treesitter-config', -- Parser generator tool for updating syntax as the source is edited
  require 'kickstart.plugins.lazygit',
  require 'kickstart.plugins.cmake_tools',
  require 'kickstart.plugins.heirline', -- zeioth heirline components
  { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', config = true },
  { 'Bilal2453/luvit-meta', lazy = true },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } }, -- Highlight todo, notes, etc in comments

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- :NOTE: for git conflicts install lazygit
