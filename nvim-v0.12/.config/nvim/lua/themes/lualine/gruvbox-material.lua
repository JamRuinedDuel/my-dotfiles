-- https://github.com/sainnhe/gruvbox-material
-- material-medium variant

local colors = {
  black             = '#1b1b1b',
  grey              = '#282828',
  red_dimmed        = '#4c3432',
  green_dimmed      = '#3b4439',
  blue_dimmed       = '#374141',
  yellow_dimmed     = '#4f422e',
  purple_dimmed     = '#443840',
  white_dimmed      = '#928374',
  white             = '#d4be98',
  white_bright      = '#ddc7a1',
  red               = '#ea6962',
  green             = '#a9b665',
  blue              = '#7daea3',
  yellow            = '#d8a657',
  purple            = '#d3869b',
  none              = 'NONE',
}

return {
  normal = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.yellow_dimmed, fg = colors.white },
    c = { bg = colors.none, fg = colors.white },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.green_dimmed, fg = colors.white },
    c = { bg = colors.none, fg = colors.white },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.black },
    b = { bg = colors.purple_dimmed, fg = colors.white },
    c = { bg = colors.none, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.red_dimmed, fg = colors.white },
    c = { bg = colors.none, fg = colors.white },
  },
  command = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.blue_dimmed, fg = colors.white },
    c = { bg = colors.none, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.none, fg = colors.white_dimmed },
    b = { bg = colors.none, fg = colors.white_dimmed },
    c = { bg = colors.none, fg = colors.white_dimmed },
  },
}
