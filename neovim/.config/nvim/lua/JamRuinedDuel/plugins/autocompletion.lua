vim.pack.add({
  {
    src = "https://github.com/saghen/blink.lib",
    version = "main",
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "main", -- v2
  },
})

vim.opt.autocomplete = false

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
  enabled = function()
    return vim.bo.filetype ~= "minifiles"
  end,
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      window = {
        border = "single",
      },
    },
    menu = {
      auto_show = true,
      border = "none",
      draw = {
        padding = 0,
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind" },
        },
      },
    },
    keyword = {
      range = "prefix",
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
      "cmdline",
      "omni",
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
  signature = {
    enabled = false,
  },
})

_G.Keymaps.autocompletion = function() end
