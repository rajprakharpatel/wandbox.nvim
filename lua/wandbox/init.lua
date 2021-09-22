-- this module exposes the interface of lua functions:

local config =	require('wandbox.config')

local function setup(options)
	config.set(options)
end

local function run()
-- 	require('wandbox.run').run(config.options)
	require('wandbox.run').run({client_list = {'wget'}})
end

return {
	setup = setup,
	run = run
}
