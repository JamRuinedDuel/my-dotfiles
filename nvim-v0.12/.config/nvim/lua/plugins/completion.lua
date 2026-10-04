vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.completion', version = 'main' },
})

local completion = require 'mini.completion'

completion.setup({
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = false,
  },
  fallback_action = '<C-n>',
  mappings = {
    force_twostep = '<C-Space>',
    force_fallback = '<A-Space>',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completfunc_lsp'
  end,
})

local capabilities = completion.get_lsp_capabilities()

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdlts')

_G.PluginKeymaps.completion = function()
end
