return {
  -- Keep catppuccin installed but not as default
  {
    "catppuccin/nvim",
    lazy = true, -- Don't load by default
  },
  -- Tokyo Night as active theme
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- night, storm, day, moon
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
