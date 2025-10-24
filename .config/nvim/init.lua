require('settings')

-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
--require("lazy").setup("plugins", opts)
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    -- import/override with your plugins
    { import = "plugins" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})

-- NvimTree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Telescope settings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>fG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>pt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules",
      "vendor",
      "deps",
      "_build"
    }
  }
}

-- Actions on init.lua
vim.keymap.set("n", "<leader><leader>", "<cmd>source $MYVIMRC<cr>", { desc = "Reload init.lua" })
vim.keymap.set("n", "<leader>v", "<cmd>e $MYVIMRC<cr>", { desc = "Edit init.lua" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- NvimTree
vim.keymap.set("n", "<leader>/", "<cmd>NvimTreeToggle<cr>", { desc = "Open NvimTree" })


-- LSP

-- Define shared capabilities for nvim-cmp completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- TypeScript (tsserver) setup
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

-- ElixirLS setup
vim.lsp.config("elixirls", {
  cmd = { "/opt/homebrew/bin/elixir-ls" },
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
      enableTestLenses = true,
    },
  },
})

local cmp = require'cmp'
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
      local indent_nodes = true
        ls.lsp_expand(args.body, {
        indent = indent_nodes,
      })
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Treesitter syntax highlighting
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "html",
    "javascript",
    "elixir",
    "erlang",
    "jsdoc",
    "java",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "sql",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  indent = { enable = true },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd "colorscheme everforest"

require'lualine'.setup {
	options = {
				theme = 'everforest'
	}
}

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

