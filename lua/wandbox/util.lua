local util = {}

-- unload module
util.unrequire = function(module)
    package.loaded[module] = nil
end

-- return name if module/cmd is available
util.is_available = function(client)
    local function requireif(module)
        require(module)
        util.unrequire(module)
    end
    if vim.fn.executable(client) == 1 or pcall(requireif, client) then return client end
    return nil
end

-- returns the first available client in list
util.get_client = function(optins)
    for _, client in ipairs(optins.client_list) do if client ~= nil then return client end end
end

-- select compiler for a language
util.get_compiler = function(ft)
    if ft == 'python' then return 'cpython-head' end
end

-- get buffer data and format it to json
util.format_data = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local compiler = util.get_compiler(ft)
    local buff = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local code = table.concat(buff, "\n")
    return {compiler = compiler, code = code}

end
return util
