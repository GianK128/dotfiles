local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    map_cr = false
})

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
    if vim.fn["coc#pum#visible"]() ~= 0  then
        return vim.fn["coc#pum#confirm"]()
    else
        return autopairs.autopairs_cr()
    end
end

vim.keymap.set('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
