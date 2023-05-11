local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--- Normal -----------------------------------------
-- Move text up and down
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)

keymap('n', '<C-h>', 'b', opts)
keymap('n', '<C-l>', 'e', opts)

-- Increment/decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Neotree
keymap('n', '<space><S-e>', ':NvimTreeToggle<CR>', {})

-- Mason
keymap('n', '<space>M', ':Mason<CR>', {})

----- Barbar | Tab Navigation -----
-- Move to previous/next
keymap('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', 'L', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

----- GitSigns --------------------------------
keymap('n', '<space>hp', '<Cmd>Gitsigns preview_hunk<CR>', opts)

----- Terminal --------------------------------
keymap('n', '<space>ft', ':terminal<CR>', opts)

----- Toggle Markdown preview -----------------
keymap('n', '<space>md', ':MarkdownPreviewToggle<CR>', opts)
