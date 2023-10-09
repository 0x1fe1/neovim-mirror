-- keymap object is { lhs, rhs, opts = {}, mode = string }
keymap = function(keymap)
    keymap.opts = vim.tbl_deep_extend('force', keymap.opts or {}, { noremap = true, silent = true })
    keymap.mode = keymap.mode and vim.split(keymap.mode, ' ', {}) or 'n'

    vim.keymap.set(keymap.mode, keymap[1], keymap[2], keymap.opts)
end

keymap({ '<Space>', '<Nop>', mode = '' })
vim.g.mapleader = ' '

-- disable arrow keys
-- keymap({ '<Down>', '<Nop>', mode = 'n i' })
-- keymap({ '<Up>', '<Nop>', mode = 'n i' })
-- keymap({ '<Left>', '<Nop>', mode = 'n i' })
-- keymap({ '<Right>', '<Nop>', mode = 'n i' })

keymap({ '<C-S-k>', '<cmd>bnext<CR>', mode = 'n i' })
keymap({ '<C-S-j>', '<cmd>bprev<CR>', mode = 'n i' })

keymap({ '<C-h>', '<C-w>h', mode = 'n i' })
keymap({ '<C-j>', '<C-w>j', mode = 'n i' })
keymap({ '<C-k>', '<C-w>k', mode = 'n i' })
keymap({ '<C-l>', '<C-w>l', mode = 'n i' })

keymap({ '<', '<gv', mode = 'v' })
keymap({ '>', '>gv', mode = 'v' })

keymap({ '<C-s>', '<cmd>w<CR>', mode = 'n v i' })
keymap({ '<leader>t', '<cmd>Ex<CR>', mode = 'n v', opts = { desc = 'File [T]ree' } })

keymap({ '<C-u>', '<C-u>zz', mode = 'n v i' })
keymap({ '<C-d>', '<C-d>zz', mode = 'n v i' })

keymap({ '<A-k>', '<cmd>move -2<CR>', mode = 'n v i' })
keymap({ '<A-j>', '<cmd>move +1<CR>', mode = 'n v i' })

keymap({ '<leader>x', [['_x']], mode = 'n v' })
keymap({ '<leader>d', [['_d']], mode = 'n v' })

keymap({ 'Q', '<nop>', mode = 'n v' })
keymap({ 'q:', '<nop>', mode = 'n v' })

keymap({ '<C-r>', 'nop' })
keymap({ '<S-u>', '<cmd>redo<CR>' })

-- keymap({ '-', '<cmd>Oil<CR>' })
-- '<leader>f', vim.lsp.buf.format

-- Remap for dealing with word wrap
keymap({ 'k', "v:count == 0 ? 'gk' : 'k'", opts = { expr = true, silent = true } })
keymap({ 'j', "v:count == 0 ? 'gj' : 'j'", opts = { expr = true, silent = true } })

-- Diagnostic keymaps
-- keymap({ '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' } })
-- keymap({ ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' } })
keymap({ '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' } })
keymap({ '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' } })
