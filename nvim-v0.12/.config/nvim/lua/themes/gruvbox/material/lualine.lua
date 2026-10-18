local colors = require("themes.gruvbox.material.colors")

local theme = {}

theme = {
  normal = {
    a = { bg = colors.white, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.white },
  },
  insert = {
    a = { bg = colors.green, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.white },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.white },
  },
  command = {
    a = { bg = colors.blue, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.none, fg = colors.gray },
    b = { bg = colors.none, fg = colors.gray },
    c = { bg = colors.none, fg = colors.gray },
  },
}

return theme
