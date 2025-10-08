return {
	{ 'nvim-telescope/telescope.nvim', 
    tag = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' }},
  'nvim-treesitter/nvim-treesitter',
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
	'sainnhe/everforest',
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
	'neovim/nvim-lspconfig',
  { "elixir-tools/elixir-tools.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
  { "lukas-reineke/virt-column.nvim", opts = {},
    config = function()
      require("virt-column").setup()
    end
  },
	'folke/which-key.nvim',
  'hrsh7th/cmp-nvim-lsp',
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",


  { 'L3MON4D3/LuaSnip',
    lazy = false,
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    config = function()
    require("luasnip.loaders.from_snipmate").load({ paths = "./snippets" })
    end
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 50,
        },
        filesystem = {
          window = {
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
              ["<down>"] = "move_cursor_down",
              ["<C-j>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-k>"] = "move_cursor_up",
              -- ['<key>'] = function(state, scroll_padding) ... end,
            },
          }
        }
      })
    end
  }
}
