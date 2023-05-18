require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')

-- sort buffers by last used
-- require('telescope.builtin').buffers({ sort_mru = true })
local actions = require('telescope.actions')require('telescope').setup{
  pickers = {
    buffers = {
      sort_lastused = false,
      sort_mru = true
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>h', builtin.oldfiles, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-o>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ff', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', '<leader>ff', builtin.treesitter, {})
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- require'telescope'.extensions.ultisnips.ultisnips{}
-- :Telescope ultisnips


-- local function lsp_document_symbols_sorted()
--   builtin.lsp_document_symbols({
--     -- Sort the results by their start line
--     sort_last = true,
--     sorter = function(entry1, entry2)
--       local start_line1 = entry1.lnum
--       local start_line2 = entry2.lnum
--       return start_line1 < start_line2
--     end,
--   })
-- end
-- vim.keymap.set('n', '<leader>ff', lsp_document_symbols_sorted, {})
