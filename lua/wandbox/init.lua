-- this module exposes the interface of lua functions:
local config = require('wandbox.config')

local function setup(...)
    config.set(...)
end

local function run(options)
    -- 	require('wandbox.run').run(config.options)
    if options == nil or type(options) ~= "table" then
        options = config.options
	else
		put(options)
		options = vim.tbl_deep_extend("force", config.options, options)
		put(options)
    end

    require('wandbox.run').run(options)
end

return {setup = setup, run = run}
