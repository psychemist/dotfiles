return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						-- move to prev result
						["<C-k>"] = actions.move_selection_previous,
						-- move to next result
						["<C-j>"] = actions.move_selection_next,
						-- send selected items to quickfix list
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		telescope.load_extension("fzf")

		-- set keymaps
		local map = vim.keymap.set

		map("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		map("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
		map("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		map("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		map("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		map("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
