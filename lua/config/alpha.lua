local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function new_file_prompt()
  vim.ui.input({ prompt = "New file: ", completion = "file" }, function(input)
    if not input or input == "" then
      return
    end
    local path = vim.fn.expand(input)
    local dir = vim.fn.fnamemodify(path, ":h")
    vim.fn.mkdir(dir, "p")
    vim.cmd("edit " .. vim.fn.fnameescape(path))
  end)
end

local function new_plugin_prompt()
	vim.ui.input({ prompt = "New plugin: ", completion = "file" }, function(input)
		if not input or input == "" then
			return
		end

		vim.cmd("edit /home/ridndev_/.config/nvim/lua/plugins/" .. input .. ".lua")
	end)
end

dashboard.section.header.val = {
	"      _    _            _                ",
	" ___ |_| _| | ___  _ _ |_| _____         ",
	"|  _|| || | ||   || | || ||     |        ",
	"|_|  |_||___||_|_| \\_/ |_||_|_|_| _____  ",
	"                                 |_____| ",
}

dashboard.section.header.opts.position = "left"

dashboard.section.buttons.val = {
  dashboard.button("z z", "      ~/.config/", ":e ~/.config <CR>"),
  dashboard.button("z x", "      ~/.config/nvim/", ":e ~/.config/nvim <CR>"),
  dashboard.button("z c", "      ~/Documents/Java/lab_04_toyland/", ":e ~/Documents/Java/lab_04_toyland/ <CR>"),
  dashboard.button("c z", "    󰭆  VEX makelog", ":e ~/vexrit/ForkTemplate <CR>"),
  dashboard.button("c x", "    󰭆  VEX 2027-15", ":e ~/vexrit/2027-15 <CR>"),
  dashboard.button("c c", "    󰭆  VEX ForkTemplate", ":e ~/vexrit/ForkTemplate <CR>"),
  dashboard.button("l l", "    󰮫  Lazy/Open Menu", ":Lazy <CR>"),
  dashboard.button("l s", "    󰳿  Lazy/Sync", ":Lazy sync <CR>"),
  dashboard.button("l u", "    󱈖  Lazy/Update", ":Lazy update <CR>"),
  dashboard.button("n f", "      New file", "", { callback = new_file_prompt, noremap = true, silent = true, nowait = true }),
  dashboard.button("n l", "      New nvim plugin", "", { callback = new_plugin_prompt, noremap = true, silent = true, nowait = true }),
  dashboard.button("r",   "    󰋚  Recent files", ":browse oldfiles<CR>"),
  dashboard.button("q",   "      Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.position = "left"
end

dashboard.section.footer.opts.position = "left"

alpha.setup(dashboard.config)
