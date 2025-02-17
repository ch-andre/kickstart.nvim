-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>Ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd file', silent = true })

    local toggle_opts = {
      border = 'rounded',
      title_pos = 'center',
      ui_width_ratio = 0.40,
    }

    vim.keymap.set('n', '<leader>HH', function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    end, { desc = '[H]arpoon toggle quick menu', silent = true })

    local hkeys = {
      q = { 1, '1st' },
      s = { 2, '2nd' },
      d = { 3, '3rd' },
      f = { 4, '4th' },
      g = { 5, '5th' },
    }

    for key, mapping in pairs(hkeys) do
      vim.keymap.set('n', '<leader>H' .. key, function()
        harpoon:list():select(mapping[1])
      end, { desc = '[H]arpoon open ' .. mapping[2] .. ' file', silent = true })
    end
  end,
}
