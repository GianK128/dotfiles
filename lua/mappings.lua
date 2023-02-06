local keymap = vim.keymap

-- Moving lines up and down
keymap.set('n', '<A-Up>', ':m -2<CR>')
keymap.set('n', '<A-Down>', ':m +1<CR>')
