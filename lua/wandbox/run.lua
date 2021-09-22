local util = require("wandbox.util")

local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("wandbox.dkjson")

local base_url = "https://wandbox.org/api"

local function http_request(args)
    -- http.request(url [, body])
    -- http.request{
    --  url = string,
    --  [sink = LTN12 sink,]
    --  [method = string,]
    --  [headers = header-table,]
    --  [source = LTN12 source],
    --  [step = LTN12 pump step,]
    --  [proxy = string,]
    --  [redirect = boolean,]
    --  [create = function]
    -- }
    --
    --
    local resp, r = {}, {}
    if args.endpoint then
        local params = ""
        if args.method == nil or args.method == "GET" then
            -- prepare query parameters like http://xyz.com?q=23&a=2
            if args.params then for i, v in pairs(args.params) do params = params .. i .. "=" .. v .. "&" end end
        end
        params = string.sub(params, 1, -2)
        local url = ""
        if params then
            url = base_url .. args.endpoint .. "?" .. params
        else
            url = base_url .. args.endpoint
        end
        local client, code, headers, status = http.request {
            url = url,
            sink = ltn12.sink.table(resp),
            method = args.method or "GET",
            headers = args.headers,
            source = args.source,
            step = args.step,
            proxy = args.proxy,
            redirect = args.redirect,
            create = args.create
        }
        r['code'], r['headers'], r['status'], r['response'] = code, headers, status, resp
    else
        error("endpoint is missing")
    end
    return r
end

-- curl post request
local function curl_get(data)
    local cmd = [[curl -s -H "Content-type: application/json" -d ]] .. "'" .. data .. "'" ..
                    [[ https://wandbox.org/api/compile.json]]
    local fh = io.popen(cmd)
    local out = fh:read("a")
    fh:close()
    return out
end

-- wget post request
local function wget_get(data)
    local cmd = [[wget -q --header="Content-type: application/json" --post-data=]] .. "'" .. data .. "'" ..
                    [[ https://wandbox.org/api/compile.json -O -]]
    local fh = io.popen(cmd)
    local out = fh:read("a")
    fh:close()
    return out
end

-- luasocket post request
local function luasocket_get(data)
    local endpoint = "/compile.json"
    -- print(endpoint)
    local req_body = data
    local headers = {["Content-Type"] = "application/x-www-form-urlencoded", ["Content-Length"] = #req_body}
    local res = http_request {
        endpoint = endpoint,
        method = "POST",
        source = ltn12.source.string(req_body),
        headers = headers
    }
    return res
end

-- main runner
local function run(client_list)
    local client = util.get_client(client_list)
    local buf_data = util.format_data()
    local data = json.encode(buf_data)
    local res = ''
    if client == 'curl' then res = curl_get(data) end
    if client == 'wget' then res = wget_get(data) end
    if client == 'socket' then res = luasocket_get(data) end
    vim.cmd('copen')
    vim.fn.setqflist({{text = res}})
end

return {run = run}
