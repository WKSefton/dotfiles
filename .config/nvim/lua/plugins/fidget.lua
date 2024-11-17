return {
	"j-hui/fidget.nvim",
	opts = {
		-- Options related to logging
		logger = {
			level = vim.log.levels.INFO, -- Minimum logging level
			max_size = 10000, -- Maximum log file size, in KB
			float_precision = 0.01, -- Limit the number of decimals displayed for floats
			-- Where Fidget writes its logs to
			path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
		},
	},
}
