return {
  "nvim-mini/mini.clue",
  version = false,
  config = function()
    local miniclue = require("mini.clue")

    miniclue.setup({
      clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },
        { mode = "i", keys = "<c-x>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<c-r>" },
        { mode = "c", keys = "<c-r>" },
        { mode = "n", keys = "<c-w>" },
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
      window = {
        config = {
          anchor = "SE",
          width = "auto",
        },
        delay = 100,
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
    })
  end,
}
