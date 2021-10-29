local is_avail = require("wandbox.util").is_available
local config = {}

config.options = {
	client_list = { is_avail("curl"), is_avail("wget"), is_avail("socket") },
	compilers = {
		cpp = "clang-head",
		c = "gcc-head",
		coffee = "coffeescript-head",
		crystal = "crystal-head",
		cs = "mono-head",
		d = "dmd-head",
		elixir = "elixir-head",
		erlang = "erlang-head",
		go = "go-head",
		groovy = "groovy-head",
		haskell = "ghc-head",
		java = "openjdk-head",
		javascript = "nodejs-head",
		lazyk = "lazyk",
		lisp = "sbcl-head",
		lua = "lua-5.3.4",
		nim = "nim-head",
		ocaml = "ocaml-head",
		pascal = "fpc-head",
		perl = "perl-5.25.10",
		php = "php-head",
		pony = "pony-head",
		python = "cpython-head",
		rill = "rill-head",
		ruby = "ruby-head",
		rust = "rust-head",
		scala = "scala-2.13.x",
		sh = "bash",
		sql = "sqlite-head",
		swift = "swift-head",
		vim = "vim-head",
	},
	options = {},
	compiler_option_raw = { cpp = "-fno-color-diagnostics" },
	stdin = nil,
	runtime_option_raw = {},
	save = nil,
	open_qf = nil,
}

config.set = function(options)
	config.options = vim.tbl_extend("force", config.options, options)
end

return config
