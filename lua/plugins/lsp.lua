return {
  "neovim/nvim-lspconfig",

  opts = function()
    vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = '>' },
	signs = true,
	underline = true,
	severity_sort = true
    })
  end,

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
      },
    })

    vim.lsp.enable("clangd")
  end,
}
