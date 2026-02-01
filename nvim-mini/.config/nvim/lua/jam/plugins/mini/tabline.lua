return {
  "nvim-mini/mini.tabline",
  enabled = false,
  version = false,
  event = "VeryLazy",
  config = function()

    -- customize tabline highlight groups
    local function set_tabline_highlights()
      vim.api.nvim_set_hl(0, "MyTablineActive",            { fg = "#eceff4", bold = true })
      vim.api.nvim_set_hl(0, "MyTablineInactive",          { fg = "#4c566a", bold = false })
      vim.api.nvim_set_hl(0, "Tabline",                    { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TablineFill",                { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniTablineFill",            { link = "TabLineFill" })
      vim.api.nvim_set_hl(0, "MiniTablineCurrent",         { link = "MyTablineActive" })
      vim.api.nvim_set_hl(0, "MiniTablineVisible",         { link = "MyTablineInactive" })
      vim.api.nvim_set_hl(0, "MiniTablineHidden",          { link = "MyTablineInactive" })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "MyTablineActive" })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "MyTablineInactive" })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden",  { link = "MyTablineInactive" })
    end
    -- apply changes immediately
    set_tabline_highlights()

    -- reapply on colorscheme change
    vim.api.nvim_create_autocmd("Colorscheme", {
      callback = set_tabline_highlights,
    })

    require("mini.tabline").setup({
      tabpage_section = 'left',
      show_icons = false, -- disable default icons
      format = function(buf_id, label)
        local bo = vim.bo[buf_id]

        -- skip unlisted or special buffers
        if not bo.buflisted or bo.buftype ~= "" then
          return nil
        end

        local is_active = buf_id == vim.api.nvim_get_current_buf()
        local icon = is_active and " " or " "

        -- modified indicator
        if bo.modified then
          label = label .. " *"
        end

        return " " .. icon .. label .. " "
      end,
    })
  end,
}

