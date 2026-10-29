_G.Utils.Pack = {}

_G.Utils.Pack.get_all_plugins = function()
  return vim.pack.get()
end

--- Get list of active plugins
_G.Utils.Pack.get_active_plugins = function()
  local active_plugins = {}
  local plugins = _G.Utils.Pack.get_all_plugins()

  for _, plugin in ipairs(plugins) do
    if plugin.active then
      table.insert(active_plugins, plugin.spec.name)
    end
  end

  return active_plugins
end

--- Get list of inactive plugins
_G.Utils.Pack.get_inactive_plugins = function()
  local inactive_plugins = {}
  local plugins = _G.Utils.Pack.get_all_plugins()

  for _, plugin in ipairs(plugins) do
    if not plugin.active then
      table.insert(inactive_plugins, plugin.spec.name)
    end
  end

  return inactive_plugins
end

--- Update plugin
_G.Utils.Pack.update_plugin = function(name)
  vim.pack.update(name)
end

_G.Utils.Pack.update_all_plugins = function()
  vim.pack.update()
end

--- Remove plugin
_G.Utils.Pack.remove_plugin = function(name)
  vim.pack.del(name)
end

_G.Utils.Pack.clean_plugins = function()
  local unused_plugins = _G.Utils.Pack.get_inactive_plugins()
  local success, _ = pcall(_G.Utils.Pack.remove_plugin, unused_plugins)

  if success then
    vim.notify("Inactive packages (" .. #unused_plugins .. ") has been removed successfully.", vim.log.levels.INFO)
  else
    vim.notify("Removing inactive packages failed.", vim.log.levels.ERROR)
  end
end

_G.Utils.Pack.update_plugins = function()
  local success, _ = pcall(_G.Utils.Pack.update_all_plugins)

  if success then
    vim.notify("All packages are up-to-date", vim.log.levels.INFO)
  else
    vim.notify("Updating packages failed.", vim.log.levels.ERROR)
  end
end

_G.Keymaps.pack = function()
  vim.keymap.set("n", "<leader>pu", _G.Utils.Pack.update_plugins, {
    desc = "Pack: update plugins",
  })
  vim.keymap.set("n", "<leader>pc", _G.Utils.Pack.clean_plugins, {
    desc = "Pack: remove unused plugins",
  })
end
