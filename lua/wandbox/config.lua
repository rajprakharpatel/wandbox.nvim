local is_avail = require('wandbox.util').is_available

local config = {}

config.defaults = {client_list = {is_avail('socket'), is_avail('wget'), is_avail('curl')}}

config.options = {}

config.set = function(options)
    config.options = vim.tbl_extend("force", config.defaults, options)
end

return config
