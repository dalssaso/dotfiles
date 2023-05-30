---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ['<C-h>'] = '',
    ['<C-l>'] = '',
  },
}

M.general = {
  n = {
    [';'] = { ':', 'enter command mode', opts = { nowait = true } },
    ['<leader>gg'] = { vim.cmd.LazyGit, 'open lazygit', opts = { nowait = true, silent = true } },
  },
}

-- more keybinds!

return M
