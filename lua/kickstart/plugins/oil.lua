-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',

  lazy = false,

  opts = {
    view_options = {
      show_hidden = true,
    },
  },

  keys = {
    { '-', ':Oil<CR>', desc = 'Open parent directory', silent = true },
  },
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
