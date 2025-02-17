local mini_clue = require 'mini.clue'
mini_clue.setup {
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Bracketed
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- Bracketed
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
  },
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    mini_clue.gen_clues.builtin_completion(),
    mini_clue.gen_clues.g(),
    mini_clue.gen_clues.marks(),
    mini_clue.gen_clues.registers(),
    mini_clue.gen_clues.windows(),
    mini_clue.gen_clues.z(),
  },
}
