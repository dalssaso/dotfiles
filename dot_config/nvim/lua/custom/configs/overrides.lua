local M = {}

M.treesitter = {
  ensure_installed = {
    'bash',
    'cue',
    'dockerfile',
    'fish',
    'git_config',
    'gitcommit',
    'gitignore',
    'go',
    'gomod',
    'gowork',
    'graphql',
    'hcl',
    'http',
    'ini',
    'json',
    'json5',
    'lua',
    'markdown',
    'markdown_inline',
    'nix',
    'norg',
    'proto',
    'python',
    'regex',
    'rego',
    'rust',
    'sql',
    'terraform',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- LSPs
    'ansible-language-server',
    'bash-language-server',
    'dockerfile-language-server',
    'gopls',
    'graphql-language-service-cli',
    'helm-ls',
    'json-lsp',
    'lua-language-server',
    'python-lsp-server',
    'rust-analyzer',
    'sqls',
    'terraform-ls',
    'yaml-language-server',

    -- Formatters
    'blue',
    'buf',
    'cueimports',
    'fixjson',
    'gofumpt',
    'goimports',
    'isort',
    'nixpkgs_fmt',
    'rego',
    'rustfmt',
    'shfmt',
    'sqlfluff',
    'stylua',

    -- Diagnostics
    'ansible-lint',
    'editorconfig-checker',
    'gitlint',
    'golangci-lint',
    'hadolint',
    'jsonlint',
    'markdownlint',
    'shellcheck',
    'staticcheck',
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    initial_mode = 'insert',
    mappings = {
      n = {
        ['q'] = require('telescope.actions').close,
      },
      i = {
        ['<C-n>'] = require('telescope.actions').cycle_history_next,
        ['<C-p>'] = require('telescope.actions').cycle_history_prev,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

M.cmp = {
  mapping = {
    ['<C-k>'] = require('cmp').mapping.select_prev_item(),
    ['<C-j>'] = require('cmp').mapping.select_next_item(),
    ['<Tab>'] = require('cmp').mapping(function(fallback)
      if require('cmp').visible() then
        require('cmp').select_next_item()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
}

return M
