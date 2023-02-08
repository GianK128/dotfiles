local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup({
    options = {
        mode = "tabs", -- set to "tabs" to only show tabpages instead
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and "  "
                    or (e == "warning" and "  " or "  " )
                s = s .. sym .. n
            end
            return s
        end,
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = false,
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        separator_style = "thin",
        always_show_bufferline = false,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
})

-- Tabs movement
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
