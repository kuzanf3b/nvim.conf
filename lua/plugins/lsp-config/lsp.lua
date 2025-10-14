return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 🧠 Lua LSP
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { library = { vim.env.VIMRUNTIME } },
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- 🐍 Python LSP
		vim.lsp.config("pyright", { capabilities = capabilities })
		vim.lsp.enable("pyright")

		-- 🌐 TypeScript/JavaScript LSP (modern replacement for tsserver)
		vim.lsp.config("ts_ls", { capabilities = capabilities })
		vim.lsp.enable("ts_ls")

		-- 🐘 PHP LSP
		vim.lsp.config("intelephense", { capabilities = capabilities })
		vim.lsp.enable("intelephense")

		-- ☕ Java LSP (pakai jdtls)
		vim.lsp.config("jdtls", { capabilities = capabilities })
		vim.lsp.enable("jdtls")

		-- 🎨 HTML, CSS, JSON
		vim.lsp.config("html", { capabilities = capabilities })
		vim.lsp.enable("html")

		vim.lsp.config("cssls", { capabilities = capabilities })
		vim.lsp.enable("cssls")

		vim.lsp.config("jsonls", { capabilities = capabilities })
		vim.lsp.enable("jsonls")

		-- 🔑 Keymaps per buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }
				local map = vim.keymap.set

				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "gi", vim.lsp.buf.implementation, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "<F2>", vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
