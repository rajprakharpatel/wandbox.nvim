local util = {}

-- unload module
local unrequire = function(module)
	package.loaded[module] = nil
end

-- return name if module/cmd is available
util.is_available = function(client)
	local function requireif(module)
		require(module)
		unrequire(module)
	end
	if vim.fn.executable(client) == 1 or pcall(requireif, client) then
		return client
	end
	return nil
end

-- get buffer data and format it to json
util.format_data = function(options)
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	local buff = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local code = table.concat(buff, "\n")
	return {
		compiler = options.compilers[ft],
		code = code,
		options = options.options[ft],
		stdin = options.stdin[ft],
		["compiler-option-raw"] = options.compiler_option_raw[ft],
		["runtime-option-raw"] = options.runtime_option_raw[ft],
		save = options.save[ft],
	}
end

-- set notify to 'rcarriga/nivm-notify' if available
util.notify = function(...)
	if util.is_available("notify") then
		require("notify").setup({
			timeout = 50,
			background_colour = "#000000",
		})
		require("notify")(...)
	else
		vim.notify(...)
	end
end

-- TODO: Completiion Items for ex commands
---@diagnostic disable-next-line: unused-local
util.complete_wandboxrun = function(ArgLead, CmdLine, CursorPos)
	local completion = {}
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	local opts = vim.fn.keys(require("wandbox.config").options)
	if ArgLead == "" then
		for _, v in ipairs(opts) do
			table.insert(completion, "-" .. v .. "=")
		end
	end
	if ArgLead == "-compilers=" then
		local complete_opt = require("wandbox.complete_opt").compiler_list[ft]
		for _, v in ipairs(complete_opt) do
			table.insert(completion, "-compilers=" .. v)
		end
	elseif ArgLead == "-options=" then
		local complete_opt = require("wandbox.complete_opt").options[ft]
		for _, v in ipairs(complete_opt) do
			table.insert(completion, "-options=" .. v)
		end
	end
	return completion
end

local function get_option(args, opt)
	-- 	local val = {}
	local _, first = string.find(args, opt)
	opt = opt .. ".*[ $]?"
	local _, last = string.find(args, opt)
	if not first or not last then
		return nil
	end
	return string.sub(args, first + 1, last)
end

util.process_args = function(args)
	local options = {}
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	options.valid = true
	if args == nil then
		options.valid = false
	end
	options.compilers = {}
	options.options = {}
	options.compilers[ft] = get_option(args, "-compilers=")
	if not options.compilers[ft] then
		options.valid = true
	end
	options.options[ft] = get_option(args, "-options=")
	if not options.options[ft] then
		options.valid = true
	end
	print("args: " .. args, get_option(args, "-compilers="))
	put(options)
	return options
end

return util
