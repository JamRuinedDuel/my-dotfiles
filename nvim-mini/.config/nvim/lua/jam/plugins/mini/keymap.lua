return {
  "nvim-mini/mini.keymap",
  version = false,
  config = function()

    local keymap = require("mini.keymap")
    keymap.setup()

    -- Keymaps for completion
    keymap.map_multistep("i", "<tab>",   { "pmenu_next" })
    keymap.map_multistep("i", "<s-tab>", { "pmenu_prev" })
    keymap.map_multistep("i", "<cr>",   { "pmenu_accept", "minipairs_cr" })
    keymap.map_multistep("i", "<bs>",   { "minipairs_bs" })

    -- Quick exit from insert mode to normal mode
    keymap.map_combo("i", "jk", "<bs><bs><esc>")
    keymap.map_combo("i", "kj", "<bs><bs><esc>")

    -- Create keymap for toggling MiniFiles explorer
    keymap.map_combo("n", "<leader>e",
      function()
        if not MiniFiles.close() then
          -- open in current buffer's directory
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end
    )

    -- Hide search highlighting
    keymap.map_combo({ "n", "i", "x", "c" }, "<esc><esc>",
      function()
        vim.cmd(":nohlsearch")
      end
    )
  end,
}
