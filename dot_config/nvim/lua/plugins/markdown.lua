return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.markdown = { "prettier", "markdownlint-cli2" }
      opts.formatters_by_ft["markdown.mdx"] = { "prettier", "markdownlint-cli2" }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, _)
      local lint = require("lint")
      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft.markdown = { "markdownlint-cli2" }
      lint.linters_by_ft["markdown.mdx"] = { "markdownlint-cli2" }
    end,
  },
}
