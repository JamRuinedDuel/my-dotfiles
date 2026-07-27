return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- 1. Fix the auto-select issue so Enter doesn't trigger unexpectedly
    opts.completion = {
      completopt = "menu,menuone,noinsert,noselect",
    }
    opts.preselect = cmp.PreselectMode.None

    -- 2. Configure Tab, Shift+Tab, and Enter navigation
    opts.mapping = cmp.mapping.preset.insert({
      -- Tab moves down the list, or falls back to standard tab if menu is closed
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Shift+Tab moves up to the list
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Enter confirms selection ONLY if you explicitly selected something
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ select = false }),
      }),
    })
  end,
}
