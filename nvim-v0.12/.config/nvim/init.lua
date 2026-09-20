-- init.lua

-- initialize the global keymap registry
_G.PluginKeymaps = {}

-- loads basic options
require('core.options')

require('plugins.colorscheme')
require('plugins.file-explorer')
require('plugins.statusline')

-- loads language servers
require('core.lsp')

-- loads keymaps
require('core.keymaps')
