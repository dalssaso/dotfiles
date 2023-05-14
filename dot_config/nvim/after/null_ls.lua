local null_ls = require("null-ls")
local b = null_ls.builtins

local formatters = {
    "blue",
    "cueimports",
    "cue_fmt",
    "fixjson",
    "stylua",
    "shfmt",
    "goimports",
    "gofumpt",
    "buf",
    "hclfmt",
    "isort",
    "nixfmt",
    "nixpkgs_fmt",
    "rego",
    "rustfmt",
    "terraform_fmt",
}

null_ls.setup({
  sources = {
    b.formatting.blue,
    b.formatting.cueimports,
    b.formatting.cue_fmt,
    b.formatting.fixjson,
    b.formmating.stylua,
    b.formatting.shfmt,
    b.formatting.goimports,
    b.formmating.gofumpt,
    b.formatting.buf,
    b.formatting.hclfmt,
    b.formatting.isort,
    b.formatting.nixfmt,
    b.formatting.nixpkgs_fmt,
    b.formatting.rego,
    b.formatting.rustfmt,
    b.formatting.terraform_fmt,

    b.formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),

    -- Hover
    --
    b.hover.dictionary,

    --
    -- Diagnostics
    --
    b.diagnostics.ansiblelint,
    b.diagnostics.editorconfig_checker,
    b.diagnostics.fish,
    b.diagnostics.gitlint,
    b.diagnostics.golangci_lint,
    b.diagnostics.gospel,
    b.diagnostics.hadolint,
    b.diagnostics.jsonlint,
    b.diagnostics.markdownlint,
    b.diagnostics.shellcheck,
    b.diagnostics.staticcheck,
    b.diagnostics.trail_space,
  },
})

require("mason-null-ls").setup({
    ensure_installed = vim.tbl_keys(formatters),
    automatic_installation = true,
    handlers = {}
})
