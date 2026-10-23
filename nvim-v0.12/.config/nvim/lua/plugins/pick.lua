vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick",  version = "main" },
  { src = "https://github.com/nvim-mini/mini.extra", version = "main" },
})

local pick = require("mini.pick")
local extra = require("mini.extra")

pick.setup({
  options = {
    content_from_bottom = true,
    use_cache = false,
  },
  window = {
    prompt_caret = "▂",
  },
})

extra.setup({})

local open_file_picker = function()
  return pick.builtin.files({
    tool = "git",
  })
end

local open_grep_live_picker = function()
  return pick.builtin.grep_live({
    tool = "git",
    globs = {},
    method = "plain",
  })
end

local open_buffer_picker = function()
  return pick.builtin.buffers({
    include_current = true,
    include_unlisted = true,
  })
end

local open_help_picker = function()
  return pick.builtin.help({
    default_split = "tab",
  })
end

local open_diagnostics_picker = function()
  return extra.pickers.diagnostic({})
end

local open_colorschemes_picker = function()
  return extra.pickers.colorschemes({})
end

local open_manpages_picker = function()
  return extra.pickers.manpages({})
end

local open_git_hunks_picker = function()
  return extra.pickers.git_hunks({})
end

_G.PluginKeymaps.pick = function()
  vim.keymap.set("n", "<leader><leader>f", open_file_picker, {
    desc = "Open file picker",
  })
  vim.keymap.set("n", "<leader><leader>s", open_grep_live_picker, {
    desc = "Open grep live picker",
  })
  vim.keymap.set("n", "<leader><leader>b", open_buffer_picker, {
    desc = "Open buffer picker",
  })
  vim.keymap.set("n", "<leader><leader>h", open_help_picker, {
    desc = "Open help picker",
  })
  vim.keymap.set("n", "<leader><leader>d", open_diagnostics_picker, {
    desc = "Open diagnostics picker",
  })
  vim.keymap.set("n", "<leader><leader>c", open_colorschemes_picker, {
    desc = "Open colorschemes picker",
  })
  vim.keymap.set("n", "<leader><leader>m", open_manpages_picker, {
    desc = "Open manpages picker",
  })
  vim.keymap.set("n", "<leader><leader>g", open_git_hunks_picker, {
    desc = "Open git hunks picker",
  })
end
