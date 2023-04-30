return {
  colorscheme = "catppuccin",

  plugins = {
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({
          flavour = "mocha",
          transparent_background = true,
        })
      end,
    },
  },
}
