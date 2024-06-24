return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      open_mapping = [[<leader>tt]],
      dir = 'git_dir',
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    },
    keys = {
      {
        '<leader>tt',
        desc = 'Toggle term',
      },
      -- Send to terminal
      {
        '<leader>tp',
        '<cmd>:ToggleTermSendCurrentLine<cr>',
        desc = 'Send current line to terminal',
      },
      {
        '<leader>tp',
        '<cmd>:ToggleTermSendVisualSelection<cr>',
        desc = 'Send visual selection to terminal',
        mode = 'v',
      },
    },
  },
}
