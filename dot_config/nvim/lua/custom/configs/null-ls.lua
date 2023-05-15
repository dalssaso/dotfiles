local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.blue,
  formatting.cueimports,
  formatting.cue_fmt,
  formatting.fixjson,
  formatting.stylua,
  formatting.shfmt,
  formatting.goimports,
  formatting.gofumpt,
  formatting.buf,
  formatting.hclfmt,
  formatting.isort,
  formatting.nixfmt,
  formatting.nixpkgs_fmt,
  formatting.rego,
  formatting.rustfmt,
  formatting.terraform_fmt,

  formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
  }),

  diagnostics.ansiblelint,
  diagnostics.editorconfig_checker,
  diagnostics.fish,
  diagnostics.gitlint,
  diagnostics.golangci_lint,
  diagnostics.gospel,
  diagnostics.hadolint,
  diagnostics.jsonlint,
  diagnostics.markdownlint,
  diagnostics.shellcheck,
  diagnostics.staticcheck,
  diagnostics.trail_space,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
