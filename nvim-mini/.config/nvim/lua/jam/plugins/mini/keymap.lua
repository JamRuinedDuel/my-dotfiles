return {
  "nvim-mini/mini.keymap",
  version = false,
  config = function()

    local keymap = require("mini.keymap")
    keymap.setup()

    -- Keymaps for completion
    keymap.map_multistep("i", "<tab>", { "pmenu_next" })
    keymap.map_multistep("i", "<s-tab>", { "pmenu_prev" })
    keymap.map_multistep("i", "<cr>", { "pmenu_accept", "minipairs_cr" })
    keymap.map_multistep("i", "<bs>", { "minipairs_bs" })
  end,
}
