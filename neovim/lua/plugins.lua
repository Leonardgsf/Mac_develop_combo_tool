local packer = require("packer")
packer.startup(function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")
	-- 你的插件列表...
	-- nvim-tree (新增)
	--use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- bufferline (新增)
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
	-- lualine (新增)
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")
	-- telescope （新增）
	-- use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope.nvim", requires = { {"nvim-lua/plenary.nvim","nvim-telescope/telescope-live-grep-args.nvim" }},config = function()
    require("telescope").load_extension("live_grep_args")
  end })
    use {
    'nosduco/remote-sshfs.nvim',
    requires = { {'nvim-telescope/telescope.nvim'} } -- optional if you declare plugin somewhere else
    }
   --  use {
   --  "nvim-telescope/telescope-file-browser.nvim",
   --  requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
   -- }
	-- project
	use("ahmedkhalf/project.nvim")
	-- telescope extensions
	use("LinArcX/telescope-env.nvim")
	-- dashboard-nvim (新增)
	use("glepnir/dashboard-nvim")
	-- nerdtree
	use("scrooloose/nerdtree")
	use("jistr/vim-nerdtree-tabs")
	use("Xuyuanp/nerdtree-git-plugin")
	-- treesitter （新增）
 	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
 	-- use({ "nvim-treesitter/nvim-treesitter" })
	--------------------- LSP --------------------
	--use("williamboman/nvim-lsp-installer")
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
	-- Lspconfig
	 use({ "neovim/nvim-lspconfig" })


	-- Lua 增强
	use("folke/neodev.nvim")
	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- snippet 引擎
	use("hrsh7th/vim-vsnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")

	-- ui (新增)
	use("onsails/lspkind-nvim")
	use({"lukas-reineke/indent-blankline.nvim", main="ibl"})

	-- indent-blankline
-- 	use({"lukas-reineke/indent-blankline.nvim", config = function()
--     require('ibl').setup({
--         exclude = {
--             buftypes = { 'terminal' },
--             filetypes = { 'dashboard', 'packer', 'lsp-installer' }
--         },
--         scope = {
--             enabled = true,
--             show_end = true
--         }
--     })
-- end})
    -- use ({
    --     "lukas-reineke/indent-blankline.nvim",
    --     disable = true,  -- 禁用当前版本
    --     config = function()
    --         vim.cmd("packadd! indent-blankline.v2")  -- 启用版本 2
    --     end
    -- })

	use("tami5/lspsaga.nvim") -- 新增

	-- 代码格式化
    -- use("mhartington/formatter.nvim")
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	-- JSON 增强
	use("b0o/schemastore.nvim")
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
	-- Comment
	use("numToStr/Comment.nvim")

	-- nvim-autopairs
	use("windwp/nvim-autopairs")
	-- gitsigns
	use("lewis6991/gitsigns.nvim")
  -- gtags
  -- use("jsfaint/gen_tags.vim")

	--------------------- colorschemes --------------------
	-- tokyonight
	use("folke/tokyonight.nvim")
	-- OceanicNext
	use("mhartington/oceanic-next")
	-- gruvbox
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
	-- zephyr 暂时不推荐，详见上边解释
	-- use("glepnir/zephyr-nvim")
	-- nord
	use("shaunsingh/nord.nvim")
	-- onedark
	use("ful1e5/onedark.nvim")
	-- nightfox
	use("EdenEast/nightfox.nvim")
  -- use("ludovicchabant/vim-gutentags")
  -- LSP-ZERO
  use {
      "VonHeikemen/lsp-zero.nvim",
      requires = {
          -- LSP Support
          {"neovim/nvim-lspconfig"},
          {"williamboman/mason.nvim"},
          {"williamboman/mason-lspconfig.nvim"},

          -- Autocompletion
          {"hrsh7th/nvim-cmp"},
          {"hrsh7th/cmp-buffer"},
          {"hrsh7th/cmp-path"},
          {"saadparwaiz1/cmp_luasnip"},
          {"hrsh7th/cmp-nvim-lsp"},
          {"hrsh7th/cmp-nvim-lua"},

          -- Snippets
          {"L3MON4D3/LuaSnip"},
          {"rafamadriz/friendly-snippets"},
      }
  }
  --use("gbprod/phpactor.nvim")
  use("zivyangll/git-blame.vim")
  use("tpope/vim-fugitive")
  use("xiyaowong/transparent.nvim")
  use("rlue/vim-barbaric")
  use("stevearc/aerial.nvim")
  use("junegunn/fzf")
  use("tpope/vim-surround")
  use("adelarsq/vim-matchit")
  use("tpope/vim-repeat")
  -- use("ashisha/image.vim")
  use("tpope/vim-abolish")
  use("nelstrom/vim-visual-star-search")
  use("ianding1/leetcode.vim")
  use("mfussenegger/nvim-jdtls")
  use({"Exafunction/codeium.vim",
      config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-i>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-y>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end})
  --[[ use {
  "chrsm/impulse.nvim",
  config = function()
    require("impulse").setup({api_key='secret_lo6jZe00KENU3YxnrPdgCuupAjHigDTNgwN9JY67kS4',always_refetch=false,open_in_browser=false})
  end,
  requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  } ]]
  use ({"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
  end})
  --vim-rooter 定位文件目录
  --use("airblade/vim-rooter")
	-------------------------------------------------------
    --java
end)

-- 每次保存 plugins.lua 自动安装插件
-- pcall(
-- 	vim.cmd,
-- 	[[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
--   ]]
-- )
