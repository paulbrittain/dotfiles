local builtin = require('telescope.builtin')
-- Disable default vim-go key mappings
vim.cmd [[let g:go_def_mapping_enabled = 0]]
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', ':Telescope live_grep<CR>')
local actions = require('telescope.actions')
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    }
  },
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    }
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- open file_browser with the path of the current buffer
vim.keymap.set("n","<space>fb",":Telescope file_browser path=%:p:h select_buffer=true<CR>",{ noremap = true })