vim.pack.add({
  -- neo-tree
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3'),
  },
  -- dependencies
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
})

-- neo-tree configuration
require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true,
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
        ['h'] = 'close_node',
        ['l'] = 'open',
        ['oc'] = 'none',
        ['od'] = 'none',
        ['og'] = 'none',
        ['om'] = 'none',
        ['on'] = 'none',
        ['os'] = 'none',
        ['ot'] = 'none',
      },
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- change type
        added = ' ',
        deleted = ' ',
        modified = ' ',
        renamed = ' ',
        -- status type
        untracked = '󰛄 ',
        ignored = ' ',
        unstaged = '󰝣 ',
        staged = ' ',
        conflict = ' ',
      },
    },
  },
})


-- Netrw configuration for fallback
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 4


-- set file explorer custom keymaps
_G.PluginKeymaps.file_explorer = function()
  -- <leader>e
  vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', {
    desc = 'Toggle file explorer side panel',
    silent = true,
  })
end
