local actions = require('telescope.actions')
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = actions.close,
          ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
          ['<c-j>'] = actions.move_selection_next,
          ['<c-k>'] = actions.move_selection_previous,
        },
      },
    },
  },
}
