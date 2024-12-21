-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  opts = {},
  keys = {
    { '-', ':Oil<CR>', desc = 'Open parent directory', silent = true },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}
