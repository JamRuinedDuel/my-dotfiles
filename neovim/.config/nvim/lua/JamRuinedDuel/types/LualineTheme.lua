---@meta

---@class LualineTheme
---@field normal? LualineThemeMode lualine normal mode
---@field insert? LualineThemeMode lualine insert mode
---@field visual? LualineThemeMode lualine visual mode
---@field replace? LualineThemeMode lualine replace mode
---@field command? LualineThemeMode lualine command mode
---@field inactive? LualineThemeMode lualine inactive mode

---@class LualineThemeMode
---@field a? LualineThemeHighlightGroup lualine A section
---@field b? LualineThemeHighlightGroup lualine B section
---@field c? LualineThemeHighlightGroup lualine C section

---@class LualineThemeHighlightGroup
---@field bg? string background color
---@field fg? string foreground color
---@field gui? string font style
