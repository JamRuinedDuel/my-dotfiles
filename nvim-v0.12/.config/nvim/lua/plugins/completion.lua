vim.pack.add({
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.cmp" },
})

local cmp = require("blink.cmp")

cmp.build():pwait()
cmp.setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },
  completion = {
    documentation = {
      auto_show = true,
    },
    menu = {
      auto_show = true,
    },
    keyword = {
      range = "full",
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
    ghost_text = {
      enabled = true,
    },
  },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

_G.PluginKeymaps.completion = function() end
