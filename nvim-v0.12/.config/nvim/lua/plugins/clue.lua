vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.clue', version = 'main' },
})

local clue = require 'mini.clue'

clue.setup({
  triggers = {
    -- leader triggers (essential)
    { mode = 'n', keys = '<leader>' },
    { mode = 'x', keys = '<leader>' },
    -- built-in neovim prefixes
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
    { mode = 'n', keys = '<C-w>' },
  },
  clues = {
    -- bring in preset explanations for neovim's built-in keys
    clue.gen_clues.square_brackets(),
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
  window = {
    config = {
      width = 'auto',
      anchor = 'SE',
    },
    delay = 100,
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
})

_G.PluginKeymaps.clue = function()
end
