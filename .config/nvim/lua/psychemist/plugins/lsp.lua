return {
	-- mason (manages external lsp servers, linters, formatters, etc)
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- mason-lspconfig (bridge between mason & lspconfig)
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
			},
			automatic_installation = true,
			automatic_enable = true,
		},
	},

	-- lspconfig (configures the built-in LSP client)
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = vim.lsp

			-- global diagnostics config
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				float = { border = "rounded" },
			})

			-- keymaps for all lsp buffers
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local buf = event.buf
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true })
					end

					map("n", "K", vim.lsp.buf.hover)
					map("n", "gd", vim.lsp.buf.definition)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "gi", vim.lsp.buf.implementation)
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>ca", vim.lsp.buf.code_action)
					map("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end)
				end,
			})

			-- server configs (new api)
			lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			lsp.config("ccls", {})
			lsp.config("lua_ls", {})
			lsp.config("pyright", {})
			lsp.config("rust_analyzer", {})

			-- enable the language servers
			lsp.enable({
				"ccls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
			})
		end,
	},

	-- completion: nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<c-n>"] = cmp.mapping.select_next_item(),
					["<c-p>"] = cmp.mapping.select_prev_item(),
					["<cr>"] = cmp.mapping.confirm({ select = true }),
					["<c-space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
}
