return {
  "gbprod/nord.nvim",
  priority = 1000, -- load before other plugins
  config = function()
    require("nord").setup({
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    })
    vim.cmd.colorscheme("nord")
  end,
}
