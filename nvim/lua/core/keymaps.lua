-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<c-c>', ':close<CR>') -- close window

-- open terminal in vertical window
vim.keymap.set('n', '<leader>t', ':vsplit | terminal<CR>')
-- open new vertical window
vim.keymap.set('n', '<leader>nv', ':vnew<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

