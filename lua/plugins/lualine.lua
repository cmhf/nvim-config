return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local owo_theme = {
      normal = {
        a = { bg = "#87d7ff", fg = "#303030", gui = "bold" },
        b = { bg = "#444444", fg = "#87d7ff" },
        c = { bg = "#3a3a3a", fg = "#b2b2b2" },
      },
      insert = {
        a = { bg = "#87afd7", fg = "#444444", gui = "bold" },
        b = { bg = "#444444", fg = "#87afd7" },
        c = { bg = "#3a3a3a", fg = "#b2b2b2" },
      },
      visual = {
        a = { bg = "#87d787", fg = "#303030", gui = "bold" },
        b = { bg = "#444444", fg = "#87d787" },
        c = { bg = "#3a3a3a", fg = "#b2b2b2" },
      },
    }

    require("lualine").setup({
      options = { theme = "auto" },
    })
  end,
}
