-- return {
--     "stevearc/conform.nvim",
--     opts = {
--         formatters_by_ft = {
--             lua = { "stylua" },
--             javascript = { "prettier" },
--             typescript = { "prettier" },
--             python = { "black" },
--             go = { "gofmt" },
--         },
--         format_on_save = function(buf)
--             local ft = vim.bo[buf].filetype
--             return ft ~= "markdown" -- whatever you want
--         end,
--     },
-- }


return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 5000,
                lsp_format = "fallback",
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				elixir = { "mix" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
