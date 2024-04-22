local lsp = require("lsp-zero")
lsp.preset("recommended")

local common = require("lsp.common-config")
local on_attach = function(client, bufnr)
	-- local opts = {buffer = 0}
	vim.diagnostic.config({
		enable = false,
		-- virtual_text = true,
	})

	common.disableFormat(client)
	common.keyAttach(bufnr)
	--[[ vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts) ]]
end

lsp.ensure_installed({
	"intelephense",
})

lsp.configure("intelephense", {
	on_attach = on_attach,
})

return {
	on_setup = function()
		lsp.setup()
		-- server:setup(opts)
	end,
}
