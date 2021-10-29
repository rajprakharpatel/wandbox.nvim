local util = require("wandbox.util")
local json = vim.json

local loop = vim.loop
local notify = util.notify

local results = {}
-- callback function of stdout and stderr file decriptors
local function onread(err, data)
	if err then
		notify(
			"ERROR: " .. err,
			vim.log.levels.ERROR,
			{ title = "wandbox.nvim" }
		)
		-- TODO handle err
	end
	if data then
		local vals = vim.split(data, "\n")
		for _, d in pairs(vals) do
			if d == "" then
				goto continue
			end
			table.insert(results, d)
			::continue::
		end
	end
end

-- Format data for display in QF
local function qfFormat(s, delimiter, title)
	local result = {}
	if title ~= nil then
		table.insert(result, { text = title, type = "E" })
	end
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, { text = match })
	end
	return result
end

-- populate quickfix with output
local function setQF()
	if results[1] == "SSL_INIT" then
		results = { unpack(results, 2) }
	end

	local ok, results_json = pcall(json.decode, table.concat(results, "\n"))
	if ok == false then
		notify(
			"Error in request",
			vim.log.levels.WARN,
			{ title = "wandbox.nvim" }
		)
		vim.fn.setqflist({ { text = table.concat(results) } })
	elseif results_json.status == "0" then
		notify(
			"compiled successfully",
			vim.log.levels.INFO,
			{ title = "wandbox.nvim" }
		)
		local qfData = {}
		if results_json.program_message ~= nil then
			qfData = qfFormat(results_json.program_message, "\n")
		elseif results_json.program_output ~= nil then
			qfData = qfFormat(results_json.program_output, "\n")
		else
			print("No Output")
		end
		vim.fn.setqflist(qfData)
	elseif results_json.status == "1" then
		notify(
			"Error in Program",
			vim.log.levels.ERROR,
			{ title = "wandbox.nvim" }
		)
		local qfData = { {} }
		if results_json.compiler_message ~= nil then
			qfData = qfFormat(
				results_json.compiler_message,
				"\n",
				"Compiler Message:"
			)
		elseif results_json.program_message ~= nil then
			qfData = qfFormat(
				results_json.program_message,
				"\n",
				"Program Message:"
			)
		else
			print("No Output")
		end
		vim.fn.setqflist(qfData)
	end
	local count = #results
	for i = 0, count do
		results[i] = nil
	end -- clear the table for next output
end

-- Compile POST request
local function compile(data, client, open_qf)
	local stdout = loop.new_pipe(false)
	local stderr = loop.new_pipe(false)

	if client == "curl" then
		-- print("using curl")
		Handle = loop.spawn(
			"curl",
			{
				args = {
					"-s",
					"-H",
					'"Content-type: application/json"',
					"-d",
					data,
					"https://wandbox.org/api/compile.json",
				},
				stdio = { nil, stdout, stderr },
			},
			vim.schedule_wrap(function()
				stdout:read_stop()
				stderr:read_stop()
				stdout:close()
				stderr:close()
				Handle:close()
				setQF()
				if open_qf then
					vim.api.nvim_command("copen")
				end
			end)
		)
	elseif client == "wget" then
		-- print("using wget")
		Handle = loop.spawn(
			"wget",
			{
				args = {
					"-qO",
					"-",
					"--header=",
					'"Content-type: application/json"',
					"--post-data",
					data,
					"https://wandbox.org/api/compile.json",
				},
				stdio = { nil, stdout, stderr },
			},
			vim.schedule_wrap(function()
				stdout:read_stop()
				stderr:read_stop()
				stdout:close()
				stderr:close()
				Handle:close()
				setQF()
				if open_qf then
					vim.api.nvim_command("copen")
				end
			end)
		)
	end

	loop.read_start(stdout, onread)
	loop.read_start(stderr, onread)
end

-- main runner
local function run(options)
	local client = options.client_list[1]
	-- notify("using " .. client, vim.log.levels.TRACE, {title = 'wandbox.nvim'})
	local buf_data = util.format_data(options)
	if buf_data.compiler == nil then
		notify(
			"Filetype not supported",
			vim.log.levels.WARN,
			{ title = "wandbox.nvim" }
		)
		return
	end
	local ok, data = pcall(json.encode, buf_data)
	-- 	print(options.open_qf)
	if ok then
		print(data)
		compile(data, client, options.open_qf)
	else
		notify(
			"Error in formatting json",
			vim.log.levels.WARN,
			{ title = "wandbox.nvim" }
		)
	end
end

return { run = run }
