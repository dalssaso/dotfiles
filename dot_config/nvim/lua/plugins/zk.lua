return {
  {
    'zk-org/zk-nvim',
    keys = {
      { '<leader>zn', ':ZkNew<CR>', desc = 'New note', mode = 'n' },
      { '<leader>zl', ':ZkNotes<CR>', desc = 'New note', mode = 'n' },
    },
    config = function()
      require('zk').setup({
        picker = 'telescope',

        lsp = {
          config = {
            cmd = { 'zk', 'lsp' },
            name = 'zk',
            -- on_attach = require('lazyvim.util.lsp').on_attach,
          },

          auto_attach = {
            enabled = true,
            filetypes = { 'markdown' },
          },
        },
      })
    end,
  },
}
