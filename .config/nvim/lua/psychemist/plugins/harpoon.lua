return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		local map = vim.keymap.set

		-- open harpoon window
		map("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- add file to harpoon list
		map("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- open harpoon buffer ui
		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- navigate to harpoon files
		map("n", "<C-1>", function()
			harpoon:list():select(1)
		end)
		map("n", "<C-2>", function()
			harpoon:list():select(2)
		end)
		map("n", "<C-3>", function()
			harpoon:list():select(3)
		end)
		map("n", "<C-4>", function()
			harpoon:list():select(4)
		end)
		map("n", "<C-5>", function()
			harpoon:list():select(4)
		end)
		map("n", "<C-6>", function()
			harpoon:list():select(4)
		end)
		map("n", "<C-7>", function()
			harpoon:list():select(4)
		end)
		map("n", "<C-8>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		map("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
