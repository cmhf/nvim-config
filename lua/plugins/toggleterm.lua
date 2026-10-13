return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "HTerm", "VTerm", "Term" },
  keys = {
    { "<leader>th", "<cmd>HTerm<cr>", desc = "Terminal (horizontal)" },
    { "<leader>tv", "<cmd>VTerm<cr>", desc = "Terminal (vertical)" },
    { "<leader>tt", "<cmd>Term<cr>", desc = "Terminal (float)" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor(20)
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
    open_mapping = [[<c-\>]],
    direction = "float",
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- custom commands
    vim.api.nvim_create_user_command("HTerm", function()
      vim.cmd("1ToggleTerm direction=horizontal")
    end, {})

    vim.api.nvim_create_user_command("VTerm", function()
      vim.cmd("2ToggleTerm direction=vertical")
    end, {})

    vim.api.nvim_create_user_command("Term", function()
      vim.cmd("3ToggleTerm direction=float")
    end, {})

    -- terminal-mode keymaps
    function _G.set_terminal_keymaps()
      local map_opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], map_opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}
