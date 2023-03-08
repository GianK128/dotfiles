local keymap = vim.keymap

-- Moving lines up and down
keymap.set('n', '<A-Up>', ':m -2<CR>')
keymap.set('n', '<A-Down>', ':m +1<CR>')

keymap.set('i', '<A-Up>', '<Esc>:m -2<CR>')
keymap.set('i', '<A-Down>', '<Esc>:m +1<CR>')

-- Save with different command
keymap.set('n', '<C-s>', ':w<CR>')
keymap.set('i', '<C-s>', '<Esc>:w<CR>')
