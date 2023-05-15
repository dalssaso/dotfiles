local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "cue",
    "dockerfile",
    "fish",
    "git_config",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "hcl",
    "http",
    "ini",
    "json",
    "json5",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "norg",
    "proto",
    "python",
    "regex",
    "rego",
    "rust",
    "sql",
    "terraform",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
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
    "ansible-language-server",
    "bash-language-server",
    "dockerfile-language-server",
    "gopls",
    "graphql-language-service-cli",
    "helm-ls",
    "json-lsp",
    "lua-language-server",
    "python-lsp-server",
    "rust-analyzer",
    "sqls",
    "terraform-ls",
    "yaml-language-server",

    -- Formatters
    "blue",
    "buf",
    "cueimports",
    "fixjson",
    "gofumpt",
    "goimports",
    "hclfmt",
    "isort",
    "nixfmt",
    "nixpkgs_fmt",
    "rego",
    "rustfmt",
    "shfmt",
    "sqlfluff",
    "stylua",

    -- Diagnostics
    "ansible-lint",
    "editorconfig-checker",
    "gitlint",
    "golangci-lint",
    "gospel",
    "hadolint",
    "jsonlint",
    "markdownlint",
    "shellsheck",
    "staticcheck",


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

return M
