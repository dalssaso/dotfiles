local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
    ensure_installed = {
        "stylua",
    };
    automatic_installation = false,
    automatic_setup = true,
})

null_ls.setup()

mason_null_ls.setup_handlers()
