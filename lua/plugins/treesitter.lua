return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "cpp", "c", "lua", "python", "bash", "vim", "vimdoc" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "cpp", "c", "lua", "python", "bash", "vim" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
