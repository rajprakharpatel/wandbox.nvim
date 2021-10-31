-- this module exposes the interface of lua functions:
local config = require("wandbox.config")

-- setup function to set default options
local function setup(...)
	config.set(...)
end

-- main run function to be called by user
local function run(options)
	-- 	require('wandbox.run').run(config.options)
	if options ~= nil then
		if type(options) ~= "table" then
			options = require("wandbox.util").process_args(options)
			if not options.valid then
				require("wandbox.util").notify(
					"Invalid Arguments passed to WandboxRun",
					vim.log.levels.ERROR,
					{ title = "Wandbox.nvim" }
				)
				return
			end
		end
	else
		options = {}
	end

	options = vim.tbl_deep_extend("force", config.options, options)

	require("wandbox.run").run(options)
end

return { setup = setup, run = run }
