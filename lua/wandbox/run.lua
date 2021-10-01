local util = require("wandbox.util")
local json = require("wandbox.dkjson")

local loop = vim.loop

local results = {}
-- callback function of stdout and stderr file decriptors
local function onread(err, data)
    if err then
        print('ERROR: ', err)
        -- TODO handle err
    end
    if data then
        local vals = vim.split(data, "\n")
        for _, d in pairs(vals) do
            if d == "" then goto continue end
            table.insert(results, d)
            ::continue::
        end
    end
end

-- populate quickfix with output
local function setQF()
    -- table.insert(results)
    vim.fn.setqflist({{text = table.concat(results, '\n')}})
    -- api.nvim_command('copen')
    local count = #results
    for i = 0, count do results[i] = nil end -- clear the table for next search
end

-- Compile POST request
local function compile(data, client)
    local stdout = loop.new_pipe(false)
    local stderr = loop.new_pipe(false)

    if client == "curl" then
        print("using curl")
        Handle = loop.spawn('curl', {
            args = {'-s', '-H', '"Content-type: application/json"', '-d', data, 'https://wandbox.org/api/compile.json'},
            stdio = {nil, stdout, stderr}
        }, vim.schedule_wrap(function()
            stdout:read_stop()
            stderr:read_stop()
            stdout:close()
            stderr:close()
            Handle:close()
            setQF()
        end))
    elseif client == "wget" then
        print("using wget")
        Handle = loop.spawn('wget', {
            args = {
                '-q', '--header=', '"Content-type: application/json"', '--post-data', data,
                'https://wandbox.org/api/compile.json', '-O-'
            },
            stdio = {nil, stdout, stderr}
        }, vim.schedule_wrap(function()
            stdout:read_stop()
            stderr:read_stop()
            stdout:close()
            stderr:close()
            Handle:close()
            setQF()
        end))
    end

    loop.read_start(stdout, onread)
    loop.read_start(stderr, onread)
end

-- main runner
local function run(client_list)
    local client = util.get_client(client_list)
    local buf_data = util.format_data()
    local data = json.encode(buf_data)

    compile(data, client)
end

return {run = run}
