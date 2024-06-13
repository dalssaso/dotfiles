return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. vim.fn.expand('~')
      .. 'Documents/Obsidian/Dalssaso/**.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'Dalssaso',
        path = '~/Documents/Obsidian/Dalssaso',
      },
    },
    daily_notes = {
      folder = '~/Documents/Obsidian/Dalssaso/Daily Notes',
    },
  },
  keys = {
    { '<leader>on', ':ObsidianNew<CR>', desc = 'New Obsidian note', mode = 'n' },
    { '<leader>o/', ':ObsidianSearch<CR>', desc = 'Search Obsidian note', mode = 'n' },
    { '<leader>os', ':ObsidianQuickSwitch<CR>', desc = 'Quick Switch Obsidian note', mode = 'n' },
    { '<leader>otd', ':ObsidianToday<CR>', desc = 'Today Obsidian note', mode = 'n' },
    { '<leader>otm', ':ObsidianTomorrow<CR>', desc = 'Tomorrow Obsidian note', mode = 'n' },
    { '<leader>oyt', ':ObsidianYesterday<CR>', desc = 'Yesterday Obsidian note', mode = 'n' },
    { '<leader>ols', ':ObsidianLinks<CR>', desc = 'Show all obsidian links on current buffer', mode = 'n' },
    { '<leader>oln', ':ObsidianLinkNew<CR>', desc = 'Create a new obsidian link with selected text', mode = 'n' },
    {
      '<leader>oen',
      ':ObsidianExtractNote<CR>',
      desc = 'Extract current selection to a new note and link it',
      mode = 'n',
    },
    { '<leader>ol', ':ObsidianLink<CR>', desc = 'Link a visual selection to a note with picker', mode = 'n' },
    { '<leader>opi', ':ObsidianPasteImg<CR>', desc = 'Link a visual selection to a note with picker', mode = 'n' },
    { '<leader>or', ':ObsidianRename<CR>', desc = 'Rename Note', mode = 'n' },
  },
}
