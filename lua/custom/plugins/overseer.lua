return {
  'stevearc/overseer.nvim',
  opts = {},

  -- todo move to template
  -- todo treesitter text objects
  -- todo advent of nvim

  config = function(_, opts)
    require('overseer').setup(opts)

    vim.api.nvim_create_user_command('Make', function(params)
      -- Insert args at the '$*' in the makeprg
      local cmd, num_subs = vim.o.makeprg:gsub('%$%*', params.args)
      if num_subs == 0 then
        cmd = cmd .. ' ' .. params.args
      end

      -- TODO elsewhere <- (either set it in ftplugin or for the project?)
      vim.cmd.compiler { args = { 'gcc' }, bang = true }

      local task = require('overseer').new_task {
        cmd = vim.fn.expandcmd(cmd),
        components = {
          { 'on_output_quickfix', errorformat = vim.o.errorformat, set_diagnostics = true, open = not params.bang, open_height = 8 },
          'on_result_diagnostics',
          { 'on_result_diagnostics_quickfix' },
          'default',
        },
      }
      task:start()
    end, {
      desc = 'Run your makeprg as an Overseer task',
      nargs = '*',
      bang = true,
    })

    require('overseer').setup {
      templates = { 'builtin', 'user.cpp_build' },
    }
  end,
}
