-- global keymap registry
_G.PluginKeymaps = {}

-- global helper functions registry
_G.Helpers = {}

-- get highlight group attributes
_G.Helpers.get_hl_hex = function(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = true })
  local colors = {}

  if hl.fg then
    colors.fg = string.format("#%06x", hl.fg)
  else
    colors.fg = "NONE"
  end

  if hl.bg then
    colors.bg = string.format("#%06x", hl.bg)
  else
    colors.bg = "NONE"
  end

  return colors
end

_G.Helpers.clean_pack = function()
  local active_plugins = {}
  local unused_plugins = {}

  -- Identify inactive plugins on disk
  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  -- Identify inactive plugins on disk
  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No inactive plugins found.")
    return
  end

  -- Prompt for confirmation before purging
  local choice = vim.fn.confirm("Remove inactive plugins?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

_G.Helpers.toggle_undo_tree = function()
  vim.cmd("packadd nvim.undotree")
  vim.cmd("Undotree")
end

_G.PluginKeymaps.helpers = function()
  vim.keymap.set("n", "<leader>pu", vim.pack.update, {
    desc = "Pack: Update plugins",
  })
  vim.keymap.set("n", "<leader>pc", _G.Helpers.clean_pack, {
    desc = "Pack: Remove inactive plugins",
  })
  vim.keymap.set("n", "<leader>u", _G.Helpers.toggle_undo_tree, {
    desc = "Toggle built-in Undotree",
  })
end
