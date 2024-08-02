return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  keys = {
    { '<leader>cpp', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    {
      '<leader>cps',
      '<cmd>CodeSnapSave<cr>',
      mode = 'x',
      desc = 'Save selected code snapshot in ~/Dropbox/Screenshots/CodeSnap',
    },
  },
  opts = {
    save_path = '~/Dropbox/Screenshots/CodeSnap',
    has_breadcrumbs = false,
    bg_theme = 'bamboo',
    watermark = '',
    border = 'rounded',
  },
}
