local pack_clean = function()
  local active_plugins = {}
  local unused_plugins = {}

  -- Map out what is currently active
  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  -- Identify inactive plugins on disk
  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.name)
    end
  end

  if #unused_plugins == 0 then
    print("No inactive plugins found.")
    return
  end

  -- Prompt for confirmation before purging
  local choice = vim.fn.confirm('Remove inactive plugins?', '&Yes\n&No', 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

pack_clean()

_G.PluginKeymaps.package = function()
  vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'Update plugins' })
  vim.keymap.set('n', '<leader>pc', pack_clean, { desc = 'Remove inactive plugins' })
end

