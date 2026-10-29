vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("VimPackHooks", { clear = true }),
  callback = function(ev)
    if ev.data.spec.name ~= "telescope-fzf-native.nvim" then
      return
    end
    if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
      return
    end

    vim.notify("Compiling telescope-fzf-native...", vim.log.levels.INFO)
    vim.system({ "make" }, { cwd = ev.data.path }, function(obj)
      if obj.code == 0 then
        vim.schedule(function()
          vim.notify("telescope-fzf-native compiled successfully!", vim.log.levels.INFO)
        end)
      else
        vim.schedule(function()
          vim.notify("Failed to compile telescope-fzf-native:\n" .. obj.stderr, vim.log.levels.ERROR)
        end)
      end
    end)
  end,
})

vim.pack.add({
  { src = "https://github.com/BurntSushi/ripgrep" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

telescope.load_extension("fzf")

local open_file_picker = function()
  return builtin.find_files({
    hidden = true,
  })
end

local open_grep_live_picker = function()
  return builtin.live_grep({
    hidden = true,
  })
end

local open_buffer_picker = function()
  return builtin.buffers()
end

local open_help_picker = function()
  return builtin.help_tags()
end

local open_diagnostics_picker = function()
  return builtin.diagnostics()
end

local open_quickfix_picker = function()
  return builtin.quickfix()
end

local open_colorschemes_picker = function()
  return builtin.colorscheme({
    enable_preview = true,
    ignore_builtins = false,
  })
end

local open_manpages_picker = function()
  return builtin.man_pages()
end

local open_git_commits_picker = function()
  return builtin.git_commits({
    git_command = {
      "git",
      "log",
      "--oneline",
      "--abbrev-commit",
      "--",
      ".",
    },
  })
end

local open_package_picker = function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local entry_display = require("telescope.pickers.entry_display")
  local pack_mod = require("JamRuinedDuel.utils.pack")
  local plugins = pack_mod.get_all_plugins()
  if 0 == plugins then
    vim.notify("No plugins managed by vim.pack found.", vim.log.levels.INFO)
  end

  local unused_plugins = pack_mod.get_inactive_plugins()

  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 3 },
      { width = 30 },
      { remaining = true },
    },
  })

  local make_display = function(entry)
    local status_icon = entry.active and "✔" or "✘"
    local status_hl = entry.active and "DiagnosticOk" or "DiagnosticError"

    return displayer({
      { status_icon,                             status_hl },
      { entry.value,                             "Normal" },
      { entry.active and "Active" or "Inactive", "Comment" },
    })
  end

  pickers
      .new({}, {
        prompt_title = "Plugin Manager (vim.pack)",
        finder = finders.new_table({
          results = plugins,
          entry_maker = function(plugin)
            return {
              value = plugin.spec.name,
              display = make_display,
              ordinal = plugin.spec.name .. (plugin.active and " active" or " inactive"),
              active = plugin.active,
            }
          end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          -- exit cleanly on basic selection execution
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
          end)

          local function purge_inactive()
            if 0 == #unused_plugins then
              vim.notify("Your configuration is clean! No inactive plugins.", vim.log.levels.INFO)
              return
            end

            actions.close(prompt_bufnr)

            local choice = vim.fn.confirm("Remove " .. #unused_plugins .. " inactive plugins from disk?", "&Yes\n&No", 2)
            if choice == 1 then
              pack_mod.remove_plugin(unused_plugins)
              vim.notify("Successfully purged " .. #unused_plugins .. " inactive plugins.", vim.log.levels.INFO)
            end
          end

          map("n", "y", purge_inactive)
          map("n", "<C-p>", purge_inactive)

          return true
        end,
      })
      :find()
end

_G.Keymaps.telescope = function()
  vim.keymap.set("n", "<leader><leader>g", open_git_commits_picker, {
    desc = "Open Git history",
  })
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
  vim.keymap.set("n", "<leader><leader>q", open_quickfix_picker, {
    desc = "Open quick fix picker",
  })
  vim.keymap.set("n", "<leader><leader>p", open_package_picker, {
    desc = "Open package picker",
  })
end
