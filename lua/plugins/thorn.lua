return {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    
    config = function()
        require("thorn").setup({
            transparent = true,
	    styles = {
                comments = { italic = true },
		keywords = { italic = true }
	    }
	})
	vim.cmd.colorscheme("thorn")
    end
}
