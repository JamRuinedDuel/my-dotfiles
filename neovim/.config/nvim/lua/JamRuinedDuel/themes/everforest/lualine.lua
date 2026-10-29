---@type ColorPalette
local palette = require("JamRuinedDuel.themes.everforest.palette")

local theme = {
  normal = {
    a = { bg = palette.white, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.white },
  },
  insert = {
    a = { bg = palette.green, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.white },
  },
  visual = {
    a = { bg = palette.magenta, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.white },
  },
  replace = {
    a = { bg = palette.red, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.white },
  },
  command = {
    a = { bg = palette.blue, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.white },
  },
  inactive = {
    a = { bg = palette.none, fg = palette.bright_black },
    b = { bg = palette.none, fg = palette.bright_black },
    c = { bg = palette.none, fg = palette.bright_black },
  },
}

return theme
