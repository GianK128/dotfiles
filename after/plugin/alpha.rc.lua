local status, alpha = pcall(require, 'alpha')
if (not status) then return end

local dashboard = require('alpha.themes.dashboard')

-- Header configuration
dashboard.section.header.val = {
    "    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢸⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⢠⡏⠘⣆⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠎⢀⣾⠃⠀⢿⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠏⠀⣼⣿⠀⠀⢸⣿⠀⠈⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣇⠐⢿⣿⡀⠀⣼⣿⠗⢠⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢿⣀⢸⣿⡀⠀⣽⡧⢀⣼⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⢰⡒⢦⣤⣈⠛⠿⣿⠿⠺⢿⡿⠛⢋⣠⣴⠒⡶⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⣀⣀⣀⡳⣗⠘⡌⡳⡀⣕⣉⣉⣳⡁⢔⠋⡞⢚⣵⣁⣀⣀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠙⢤⣰⣹⠪⡓⡪⡮⢸⢁⣀⣀⡀⢳⠨⣎⢒⡽⢊⡷⣠⠞⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠙⢒⢶⣼⠨⢁⣸⠉⠀⠀⠈⡝⣀⠃⣯⣴⣒⠋⠁⠀⠀⠀⠀⠀⠀",
    "⠀⠀⢠⡶⠒⠶⢤⣀⠳⠵⢧⠭⣍⡀⠫⣉⣉⡽⠁⣨⠭⣤⠾⠜⢃⣤⠶⠒⠶⣄⠀⠀",
    "⠀⠀⠸⣆⣀⡆⠀⠙⠳⢦⣷⣍⣋⡿⡠⢤⢠⠤⣸⣍⣛⣼⣴⠾⠋⠁⠰⣅⣠⡿⠀⠀",
    "⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠉⠉⠸⠴⡊⣞⠤⠗⠈⠉⠁⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠉⠙⢿⡪⣩⡺⠛⠉⠉⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

-- Buttons configuration
dashboard.section.buttons.val = {
    dashboard.button("s", "  Show Files", ":Telescope show_files <CR>"),
    dashboard.button("f", "  Find a file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Footer configuration
local function footer()
    local plugin_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "   "
      .. plugin_count
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    return plugins_text
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

--local width = 24 -- 104
--local height = 24 -- 28
--dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/Documents/nvim/crest.sh"
--dashboard.section.terminal.width = width
--dashboard.section.terminal.height = height
--dashboard.section.terminal.opts.redraw = true

dashboard.config.layout = {
	{ type = "padding", val = 1 },
	dashboard.section.header,
    { type = "padding", val = 1 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.opts)
