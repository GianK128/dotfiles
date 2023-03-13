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
    dashboard.button("s", "  Show Files", ":Telescope file_browser <CR>"),
    dashboard.button("f", "  Find a file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("u", "⟳  Update packages", ":PackerUpdate <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local date = os.date "%d-%m-%Y %H:%M:%S"
local date_header = {
    type = "text",
    val = "┌─    Today is " .. date .. "  ─┐",
    opts = {
        position = "center",
    }
}

local plugins = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
local plugin_count = {
    type = "text",
    val = "└─   There are " .. plugins .. " installed plugins ─┘",
    opts = {
        position = "center",
    }
}

-- Footer configuration
local function footer()
    local plugins_text = " Neovim v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch

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
    date_header,
    plugin_count,
    { type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.opts)
