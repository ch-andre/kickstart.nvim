return {
  'stevearc/overseer.nvim',
  opts = {},

  config = function(_, opts)
    require('overseer').setup(opts)

    vim.api.nvim_create_user_command('Make', function(params)
      -- Insert args at the '$*' in the makeprg
      local cmd, num_subs = vim.o.makeprg:gsub('%$%*', params.args)
      if num_subs == 0 then
        cmd = cmd .. ' ' .. params.args
      end
      local task = require('overseer').new_task {
        cmd = vim.fn.expandcmd(cmd),
        components = {
          { 'on_output_quickfix', set_diagnostics = true, open = not params.bang, open_height = 8 },
          'on_result_diagnostics',
          -- { 'on_result_diagnostics_quickfix', open = true, open_height = 8 },
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
