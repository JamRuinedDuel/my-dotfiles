local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.hipatterns"),
  pack.gh("nvim-mini/mini.extra"),
})

local hipatterns = require("mini.hipatterns")
local extra = require("mini.extra")
local hi_words = extra.gen_highlighter.words

hipatterns.setup({
  highlighters = {
    fixme = hi_words({ " FIXME: ", "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
    hack = hi_words({ " HACK: ", "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
    todo = hi_words({ " TODO: ", "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
    note = hi_words({ " NOTE: ", "NOTE", "Note", "note" }, "MiniHipatternsNote"),
  },
})
