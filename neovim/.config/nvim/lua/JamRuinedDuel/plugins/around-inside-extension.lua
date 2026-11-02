local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.ai"),
  pack.gh("nvim-mini/mini.extra"),
})

local ai = require("mini.ai")
local extra = require("mini.extra")
local gen_ai_spec = extra.gen_ai_spec

ai.setup({
  custom_textobjects = {
    B = gen_ai_spec.buffer(),
    D = gen_ai_spec.diagnostic(),
    I = gen_ai_spec.indent(),
    L = gen_ai_spec.line(),
    N = gen_ai_spec.number(),
  },
  mappings = {
    around = "a",
    inside = "i",
    around_next = "an",
    inside_next = "in",
    around_last = "al",
    inside_last = "il",
    goto_left = "g[",
    goto_right = "g]",
  },
  n_lines = 50,
  search_method = "cover_or_next",
  silent = false,
})
