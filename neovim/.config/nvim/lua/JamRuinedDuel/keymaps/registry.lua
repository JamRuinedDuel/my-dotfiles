---@meta
---@module 'jamruinedduel.keymaps.registry'

local M = {}

-- internal storage - not exposed directly
local registry = {}

--- Register a key-map provider.
---@param name string Unique identifier (usually the plugin name)
---@param fn function Function that creates the keymap for that plugin
function M.register(name, fn)
  if type(name) ~= "string" or #name == 0 then
    error("Keymap registry: name must be a non-empty string")
  end

  if type(fn) ~= "function" then
    error("Keymap registry: fn must be a function")
  end

  registry[name] = fn
end

--- Return a *copy*of the internal table.
---@return table<string,function>
function M.all()
  local copy = {} -- shallow copy
  for k, v in pairs(registry) do
    copy[k] = v
  end
  return copy
end

--- Clear the table (useful after a full reload).
---@return nil
function M.clear()
  registry = {}
end

return M
