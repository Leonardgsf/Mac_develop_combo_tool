vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.opt.path:append(".")

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
-- map("n", "<C-i>", tostring(live_grep_args_shortcuts.grep_word_under_cursor),opt)

-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "S", "", opt)
map("n", "gh", "", opt)
map("n", "<leader>sn", "<cmd>lua ReloadConfig()<CR>",  opt)
--用,快速退出当前打开的窗口
-- map("n", ",", ":q<CR>", opt)
map("n", "<C-c>", "", opt)
map("n", "<C-c>", ":q<CR>", opt)

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- Ctrl + a Open Function List
map("n", "<A-a>", "<cmd>AerialToggle<CR>", opt)
map("n", "<C-t>", "", opt)
map("n", "<C-t>", ":NERDTreeClose<CR>:ToggleTerm size=40 dir=git_dir direction=float<CR>", opt)
-- save buffer
-- map("n", "<C-s>", ":w<cr>", opt)
-- map("i", "<C-s>", "<Esc>:w<cr>", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s.", ":vertical resize -10<CR>", opt)
map("n", "s,", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "<C-j>", ":move '>+1<CR>gv-gv", opt)
map("v", "<C-k>", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<A-j>", "4j", opt)
map("n", "<A-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
map("n", "&", '<cmd>&&<CR>', opt)
map("v", "&", '<cmd>&&<CR>', opt)

-- 退出
--[[ map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt) ]]

-- insert 模式下，跳到行首行尾
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)
-- codeium codeAI
-- map('i', '<C-g>', "", opt)
-- map('i', '<C-g>', "<Cmd>call codeium#Accept()<CR>", opt)
map("n", "<leader>f", ":NERDTreeFind<CR>", opt)
map("n", "<leader>go", ":call OpenWithFinder()<CR>", opt)
-- map("n", "gf", ":call OpenWithFinderOrGf()<CR>", opt)
-- map('i', '<c-,>', "<Cmd>call codeium#CycleCompletions(-1)<CR>", opt)

-- map('i', '<c-x>', "", )
-- bufferline
-- 左右Tab切换 option+h/l
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>mh", ":BufferLineMovePrev<CR>", opt)
map("n", "<leader>ch", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>co", ":%bd|e#|bd#<CR>:NERDTreeToggle<CR>", opt)
map("n", "<leader>ml", ":BufferLineMoveNext<CR>", opt)
map("n", "<leader>cl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":NERDTreeClose<CR>:Telescope find_files<CR>", opt)
-- map("n", "<C-g>", ":NERDTreeClose<CR>:Telescope git_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":NERDTreeClose<CR>:Telescope live_grep<CR>", opt)
map("n", "<A-x>", ":NERDTreeClose<CR>:Telescope live_grep_args<CR>", opt)
--map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- Define custom mappings for visual mode search
-- map('v', '*', ":<C-u>lua set_search('/')<CR>/<C-R>=@/<CR><CR>",opt)
-- map('v', '#', ":<C-u>lua set_search('?')<CR>/<C-R>=@?<CR><CR>",opt)
-- map('v', '<C-a>', ":<C-u>lua set_search('/')<CR>/<C-R>=@z<CR><CR>",opt)
-- map('v', '#', "<cmd>lua set_search('?')<CR>",opt)
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
--map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- Ctrl + e 键打开关闭tree
map("n", "<C-e>", ":NERDTreeToggle<CR>", opt)
map("n", "gt", ":call gitblame#echo()<CR>", opt)
map("n", "gf", ":call OpenWithFinderOrGf()<CR>", opt)
-- 列表快捷键
-- 打开文件或文件夹
--[[ pluginKeys.nvimTreeList = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
]]
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		-- ["<Down>"] = "move_selection_next",
		-- ["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<A-n>"] = "cycle_history_next",
		["<A-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	mapbuf("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	mapbuf("n", "<space>wf", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
	mapbuf("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
	mapbuf("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
	mapbuf("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
	mapbuf("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- mapbuf("n", "fm", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	return {
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}

-- typescript 快捷键
--[[ pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end ]]

return pluginKeys
