local is_avail = require("wandbox.util").is_available
local config = {}

config.options = {
    client_list = {is_avail('curl'), is_avail('wget'), is_avail('socket')},
    compilers = {
        python = 'cpython-head',
        cpp = 'clang-head',
        c = 'gcc-head',
        sh = 'bash',
        java = 'openjdk-head',
        julia = 'julia-head',
        rust = 'rust-head',
        sql = 'sqlite-head',
        lua = 'luajit-head'
    },
    options = {},
    compiler_option_raw = {cpp = '-fno-color-diagnostics'},
    stdin = {},
    runtime_option_raw = {},
    save = {}
}

config.set = function(options)
    config.options = vim.tbl_extend("force", config.options, options)
end

return config
