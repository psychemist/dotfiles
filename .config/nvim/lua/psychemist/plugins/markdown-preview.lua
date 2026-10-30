return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		local map = vim.keymap.set

		map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })
		map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown Preview Stop" })
		map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview Toggle" })
	end,
}
