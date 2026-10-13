vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.hipatterns', version = 'main' },
  { src = 'https://github.com/nvim-mini/mini.extra', version = 'main' },
})

local hipatterns = require 'mini.hipatterns'
local extra = require 'mini.extra'
local hi_words = extra.gen_highlighter.words

hipatterns.setup({
  highlighters = {
    fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
    hack  = hi_words({ 'HACK',  'Hack',  'hack'  }, 'MiniHipatternsHack'),
    todo  = hi_words({ 'TODO',  'Todo',  'todo'  }, 'MiniHipatternsTodo'),
    note  = hi_words({ 'NOTE',  'Note',  'note'  }, 'MiniHipatternsNote'),
  },
})

_G.PluginKeymaps.hipatterns = function()
end
