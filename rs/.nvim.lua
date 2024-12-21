-- /path/to/dir/.nvim.lua

vim.cmd.compiler { args = { 'cargo' }, bang = true }

require('overseer').register_template {
  name = 'Build project',
  params = {},
  condition = {
    -- This makes the template only available in the current directory
    -- In case you :cd out later
    dir = vim.fn.getcwd(),
  },

  -- https://www.reddit.com/r/neovim/comments/1dqybmg/make_workflow/
  -- TODO:  setup Grep (vim.o.grepformat)

  -- TODO: test https://github.com/stevearc/quicker.nvim
  --
  --
  -- TODO: investigate ->
  -- https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/cpp.lua

  -- TODO bashlsp -> shellexplain
  -- TODO wendy + dap + neotest + overseer (exrc, ...) + git -> ignore file ...
  --
  -- TODO: https://github.com/neovim/neovim/tree/master/runtime/compiler
  -- Custom compiler (ejmast)

  builder = function()
    return {
      cmd = { 'cargo' },
      args = { 'build' },
      components = {
        { 'on_output_quickfix', errorformat = vim.o.errorformat, set_diagnostics = true, items_only = true },
        { 'on_result_diagnostics_quickfix', open = true },
        'on_result_diagnostics_trouble',
        'default',
      },
    }
  end,
}
