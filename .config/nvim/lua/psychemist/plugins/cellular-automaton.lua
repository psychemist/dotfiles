return {
	"eandrju/cellular-automaton.nvim",

	config = function()
		local ca = require("cellular-automaton")

		local config = {
			fps = 50,
			name = "slide",
		}

		-- optional:
		-- config.init = function(grid)
		-- end

		config.update = function(grid)
			for i = 1, #grid do
				local prev = grid[i][#grid[i]]
				for j = 1, #grid[i] do
					grid[i][j], prev = prev, grid[i][j]
				end
			end
			return true
		end

		ca.register_animation(config)
	end,
}
