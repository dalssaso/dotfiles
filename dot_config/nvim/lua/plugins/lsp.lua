return {
  'neovim/nvim-lspconfig',
  opts = function(_, opts)
    opts.servers = vim.tbl_extend('force', opts.servers, {
      emmet_ls = {},
      htmx = {},
      jsonnet_ls = {},
      regols = {},
      templ = {},
      sqls = {},
      ansiblels = {},
      ltex = {
        settings = {
          language = 'en-US',
          additionalRules = {
            enablePickyRules = true,
            motherTongue = 'pt-BR',
          },
        },
      },
      helm_ls = {
        settings = {
          ['helm_ls'] = {
            yamlls = {
              path = 'yaml-language-server',
            },
          },
        },
      },
    })
  end,
}
