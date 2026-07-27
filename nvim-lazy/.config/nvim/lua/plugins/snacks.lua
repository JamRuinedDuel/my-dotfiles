return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
      hidden = true, -- Shows hidden files (e.g., .gitignore, .env)
    },
    picker = {
      -- Ensures hidden files are shown in file pickers (e.g., <leader><space>)
      hidden = true,
    },
  },
}
