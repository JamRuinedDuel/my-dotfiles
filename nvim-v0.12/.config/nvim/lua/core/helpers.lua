-- global keymap registry
_G.PluginKeymaps = {}

-- global helper functions registry
_G.Helpers = {}

-- get highlight group attributes
_G.Helpers.get_hl_hex = function(name)
  local hl = vim.api.nvim_get_hl(0, { name = name,  link = true })
  local colors = {}

  if hl.fg then
    colors.fg = string.format("#%06x", hl.fg)
  else
    colors.fg = 'NONE'
  end

  if hl.bg then
    colors.bg = string.format("#%06x", hl.bg)
  else
    colors.bg = 'NONE'
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
  local choice = vim.fn.confirm('Remove inactive plugins?', '&Yes\n&No', 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

_G.Helpers.toggle_undo_tree = function()
  vim.cmd('packadd nvim.undotree')
  vim.cmd('Undotree')
end

-- FIXME make this useful for managing plugins
_G.Helpers.open_command_in_float = function(cmd)

  -- Run the command and capture its text output
  local output = vim.fn.execute(cmd)

  -- Split the raw string output by newlines into an array of lines
  local lines = vim.split(output, '\n', { trimempty = true })

  -- Get the dimensions of the current editor grid
  local stats = vim.api.nvim_list_uis()[1]
  local grid_width = stats.width
  local grid_height = stats.height

  -- Define the size of the floating window (80% of screen)
  local width = math.floor(grid_width * 0.8)
  local height = math.floor(grid_height * 0.8)

  -- Calculate starting row and column to center the window
  local row = math.floor((grid_height - height) / 2)
  local col = math.floor((grid_width - width) / 2)

  -- Set the window configuration options
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'single',
  }

  -- Create an unlisted 'scratch' buffer for content
  -- (is_listed = false, scratch = true)
  local buf = vim.api.nvim_create_buf(false, true)

  -- Write the captured output into the buffer
  -- (0 = start of buffer, -1 = replace everything)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Open the window and set focus to it (enter = true)
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set a buffer-local keymap to easily close the window with 'q' or 'Esc'
  local map_opts = { buffer = buf, silent = true }
  vim.keymap.set('n', 'q', function() vim.api.nvim_win_close(win, true) end, map_opts)
  vim.keymap.set('n', '<esc>', function() vim.api.nvim_win_close(win, true) end, map_opts)
end

_G.PluginKeymaps.helpers = function()
  vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'Update plugins' })
  vim.keymap.set('n', '<leader>pc', _G.Helpers.clean_pack, { desc = 'Remove inactive plugins' })
  vim.keymap.set('n', '<leader>u', _G.Helpers.toggle_undo_tree, { desc = 'Toggle built-in Undotree' })
end
