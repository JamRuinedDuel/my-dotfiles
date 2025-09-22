return {
  "nvim-mini/mini.basics",
  version = false,
  config = function()
    require("mini.basics").setup({
      options = {
        basic = true,
        extra_ui = true,
        win_borders = "default",
      },
      mappings = {
        basic = false,
        option_toggle_prefix = [[\]],
        windows = true,
        move_with_alt = false,
      },
      autocommands = {
        basic = false,
        relnum_in_visual_mode = true,
      },
      silent = true,
    })
  end,
}
