local builtin = require('telescope.builtin')
-- Disable default vim-go key mappings
vim.cmd [[let g:go_def_mapping_enabled = 0]]
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>pp', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>pc', builtin.commands, {})
vim.keymap.set('n', '<leader>ph', builtin.command_history, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

vim.keymap.set('n', '<leader>pr', ':Telescope resume<CR>')

vim.keymap.set('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

vim.keymap.set('n', '<leader>fw', ':Telescope grep_string<CR>')

local actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
    },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    }
}

vim.keymap.set('n', '<leader>pn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim Files'})

