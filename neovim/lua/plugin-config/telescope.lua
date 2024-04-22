local status, telescope = pcall(require, "telescope")
local lga_actions = require("telescope-live-grep-args.actions")
if not status then
	vim.notify("没有找到 telescope")
	return
end
-- 获取 Neovim 启动时的工作目录
local initial_directory = vim.fn.getcwd()
-- 创建函数来调用 Telescope 并在调用之前手动恢复工作目录
-- function _G.search_in_initial_directory()
--   local current_directory = vim.fn.getcwd()  -- 获取当前工作目录
--   telescope.extensions.file_browser.file_browser {
--     cwd = initial_directory  -- 设置为初始工作目录
--   }
--   vim.cmd('cd ' .. current_directory)  -- 恢复到当前工作目录
-- end

-- 创建一个键映射来调用自定义 Telescope 函数
telescope.setup({
	defaults = {
        preview = {
   			treesitter = false,
   		},
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- 窗口内快捷键
		mappings = require("keybindings").telescopeList,
		layout_strategy = "horizontal",
		layout_config = { width = 0.98, preview_cutoff = 1 },
        -- file_browser = { cwd = initial_directory },
    },
	pickers = {
		-- 内置 pickers 配置
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			--theme = "dropdown",
			--theme = "ivy",
		},
	},
	extensions = {
		-- 扩展插件配置
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-y>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
	},
})

-- telescope extensions
pcall(telescope.load_extension, "env")
-- vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua search_in_initial_directory()<CR>', { noremap = true, silent = true })
