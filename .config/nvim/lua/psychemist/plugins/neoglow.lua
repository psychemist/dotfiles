return {
	"Alexandros-Pallis/neoglow.nvim",
	opts = {
		keys = {
			{
				"<leader>og",
				function()
					require("neoglow").toggle()
				end,
				desc = "Toggle Neoglow",
			},
		},
	},
}
