---@meta
---@module 'jamruinedduel.utils.pack'

--- utils/pack.lua
--- A thin abstraction over the underlying package manager (vim.pack)

local M = {}

--- Helper: safe call + user notification
---@return boolean, string|nil
local function safe_call(fn, ...)
  local ok, err = pcall(fn, ...)
  if not ok then
    vim.notify(string.format("[Pack] %s failed: %s", fn, tostring(err)), vim.log.levels.ERROR)
  end
  return ok, err
end

--- Prefixes input string with github repo url prefix
---@param spec string
---@return string
function M.gh(spec)
  return "https://github.com/" .. spec
end

--- Return the raw list of plugins as given by the manager.
---@return table
function M.list()
  return vim.pack.get()
end

--- Install a new plugin specification.
---@param spec table|table[]|string[]
---@return boolean, string|nil
function M.add(spec)
  if type(spec) ~= "table" then
    error("Pack.add: spec must be a table (or list of tables)")
  end
  return safe_call(vim.pack.add, spec)
end

--- Update a single plugin (or if `name` is nil|empty).
---@param name? string
---@return boolean, string|nil
function M.update(name)
  if name ~= nil and type(name) ~= "string" then
    error("Pack.update: name must be a string or nil")
  end
  return safe_call(vim.pack.update, name)
end

--- Update *all* plugins.
---@return boolean|nil, string|nil
function M.update_all()
  return M.update()
end

--- Remove a plugin by name.
---@param name string
---@return boolean, string|nil
function M.remove(name)
  assert(type(name) == "string", "Pack.remove: name must be a string")
  return safe_call(vim.pack.del, name)
end

--- Delete all inactive plugins.
---@return boolean
function M.clean()
  local inactive = {}

  for _, p in ipairs(M.list()) do
    if not p.active then
      table.insert(inactive, p.spec.name)
    end
  end

  if #inactive == 0 then
    vim.notify("[Pack] No inactive plugins to remove.", vim.log.levels.INFO)
    return true
  end

  local ok, err = pcall(function()
    for _, n in ipairs(inactive) do
      M.remove(n) -- reuse the safe wrapper (already notifies on error)
    end
  end)

  if ok then
    vim.notify(string.format("[Pack] Removed %d inactive plugin(s).", #inactive), vim.log.levels.INFO)
  else
    vim.notify("[Pack] Failed to clean inactive plugins: " .. tostring(err), vim.log.levels.ERROR)
  end
  return ok
end

return M
