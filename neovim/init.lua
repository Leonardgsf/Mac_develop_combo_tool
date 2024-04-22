-- 基础配置
require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置
require("colorscheme")
-- 自动命令
require("autocmds")
-- 插件配置
--require("plugin-config.nvimtree")
require("plugin-config.nerdtree")
require("plugin-config.lualine")
require("plugin-config.telescope")
-- require("plugin-config.sshfs")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.common-modle")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
-- require("utils.im-select")
-- 内置LSP (新增)
require("lsp.setup_mason")
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")
require("lsp.aerial")
require("plugin-config.bufferline")
require("user.reload")
require("functions")
