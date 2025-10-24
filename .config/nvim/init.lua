require ('krx.core')
require ('krx.lazy')
-- require('settings')
-- Install lazy package manager

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

vim.cmd "colorscheme everforest"

--
-- OPEN FILES IN DIRECTORY OF CURRENT FILE
--
-- vim.cmd("exec 'cnoremap %% <C-R>=" .. vim.fn.expand("%:h") .. "/<CR>'")
-- vim.keymap.set('n', '<leader>s', vim.cmd("exec ':vsplit %%'"), { desc = "Vsplit %%" })
-- vim.keymap.set('n', '<leader>e', vim.cmd("exec ':tabe %%'"), { desc = "Tabe %%" })

-------------------------------------------------------------------------
-- RENAME CURRENT FILE
-------------------------------------------------------------------------
function RenameFile()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', vim.fn.expand('%'), 'file')
  if (new_name ~= '' and new_name ~= old_name) then
    vim.cmd("exec ':saveas " .. new_name .. "'")
    vim.cmd("exec ':silent !rm " .. old_name .. "'")
    vim.api.nvim_command("redraw!") 
  end
end
vim.keymap.set('n', '<leader>n', RenameFile, { desc = "Rename current file" })

--
-- If Elixir run the tests
--
function RunElixirTest()
  local filename = vim.fn.expand('%')
  if string.find(filename, "_test.exs") then
    -- Test for elixir test case
    vim.cmd("exec 'bel 30 :split | terminal mix test ".. filename .. "'")
    vim.cmd("exec 'normal 1GG'")
  end
end

--
-- If Elixir run the tests
--
function RunAllElixirTests()
  -- Test for elixir test case
  vim.cmd("exec 'bel 30 :split | terminal mix test'")
  vim.cmd("exec 'normal 1GG'")
end

--
-- Edit new file in directory
--
function EditFileInDir()
  local new_name = vim.fn.input('New file name: ', vim.fn.expand('%:h') .. "/", 'file')
  vim.cmd("e ".. new_name)
end

vim.keymap.set('n', '<leader>t', RunElixirTest, { desc = "Open test window" })
vim.keymap.set('n', '<leader>T', RunAllElixirTests, { desc = "Run all tests in window" })
vim.keymap.set('n', '<leader>e', EditFileInDir, { desc = "Edit new file in dir"} )

