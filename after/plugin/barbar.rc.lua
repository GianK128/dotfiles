local status, barbar = pcall(require, 'bufferline')
if (not status) then return end

-- Configuration Options
barbar.setup({
    -- Animations
    animation = true,

    -- Hide when there is only one
    auto_hide = true,

    -- Show counter of tabs in the top right corner
    tabpages = true,

    -- Close button
    closable = true,

    -- Make clickable (left: go to, middle: close)
    clickable = true,

    -- Diagnostic symbols in tab
    diagnostics = {
        { enabled = true, icon = '' },
        { enabled = true, icon = '' },
        { enabled = true }, -- Couldn't find symbol
        { enabled = true, icon = '' },
    },

    -- Exclude buffers
    exclude_ft = {}, -- filetype
    exclude_name = {}, -- filename

    -- Highlighting alternate buffers
    highlight_alternate = false,

    -- Highlighting icons in inactive buffers
    highlight_inactive_file_icons = true,

    -- Highlighting visible buffers
    highlight_visible = true,

    -- Enable tab icons (can be 'numbers' or 'both')
    icons = true,

    -- Configure icons on the bufferline.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',

    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    insert_at_start = false,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,

    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,

    -- Sets the maximum buffer name length.
    maximum_length = 30,

    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = '[Buffer X]',
})

-- Configuration mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Tab>', '<Cmd>BufferPrevious<CR>', opts)  -- Move to next
map('n', '<S-Tab>', '<Cmd>BufferNext<CR>', opts)    -- Move to previous

map('n', '<C-Tab>', '<Cmd>BufferMovePrevious<CR>', opts)    -- Re-order to next
map('n', '<C-s-Tab>', '<Cmd>BufferMoveNext<CR>', opts)      -- Re-order to previous

-- Integration with NvimTree API
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
