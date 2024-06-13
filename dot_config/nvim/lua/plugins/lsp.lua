return {
  'neovim/nvim-lspconfig',
  -- opts = function(_, opts)
  -- opts.servers = vim.tbl_extend('force', opts.servers, {
  opts = {
    servers = {
      emmet_ls = {},
      htmx = {},
      jsonnet_ls = {},
      regols = {},
      templ = {},
      sqls = {},
    },
  },
}
