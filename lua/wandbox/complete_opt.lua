local compiler_list = {
	sh = { "bash" },
	c = {
		"gcc-head-c",
		"gcc-11.1.0-c",
		"gcc-10.1.0-c",
		"gcc-9.3.0-c",
		"gcc-9.2.0-c",
		"gcc-9.1.0-c",
		"gcc-8.3.0-c",
		"gcc-8.2.0-c",
		"gcc-8.1.0-c",
		"gcc-7.3.0-c",
		"gcc-7.2.0-c",
		"gcc-7.1.0-c",
		"gcc-6.3.0-c",
		"gcc-6.2.0-c",
		"gcc-6.1.0-c",
		"gcc-5.5.0-c",
		"gcc-5.4.0-c",
		"gcc-5.3.0-c",
		"gcc-5.2.0-c",
		"gcc-5.1.0-c",
		"gcc-4.9.3-c",
		"gcc-4.9.2-c",
		"gcc-4.9.1-c",
		"gcc-4.9.0-c",
		"gcc-4.8.5-c",
		"gcc-4.8.4-c",
		"gcc-4.8.3-c",
		"gcc-4.8.2-c",
		"gcc-4.8.1-c",
		"gcc-4.7.4-c",
		"gcc-4.7.3-c",
		"gcc-4.6.4-c",
		"gcc-4.5.4-c",
		"gcc-4.4.7-c",
		"gcc-1.27-c",
		"clang-head-c",
		"clang-11.1.0-c",
		"clang-10.0.0-c",
		"clang-9.0.0-c",
		"clang-8.0.0-c",
		"clang-7.0.0-c",
		"clang-6.0.1-c",
		"clang-6.0.0-c",
		"clang-5.0.0-c",
		"clang-4.0.1-c",
		"clang-4.0.0-c",
		"clang-3.9.1-c",
		"clang-3.8.1-c",
		"clang-3.7.1-c",
		"clang-3.6.0-c",
		"clang-3.5.0-c",
		"clang-3.4-c",
		"clang-3.3-c",
		"clang-3.2-c",
		"clang-3.1-c",
	},
	cs = {
		"mono-head",
		"mono-5.8.0.108",
		"mono-5.4.0.199",
		"mono-5.0.1.1",
		"mono-4.8.0.382",
		"mono-3.12.1",
		"mono-3.12.0",
		"mono-3.4.0",
		"mono-3.2.0",
		"dotnetcore-head",
		"dotnetcore-2.1.401",
	},
	cpp = {
		"gcc-head-pp",
		"clang-head-pp",
		"gcc-head",
		"gcc-11.1.0",
		"gcc-10.1.0",
		"gcc-9.3.0",
		"gcc-9.2.0",
		"gcc-9.1.0",
		"gcc-8.3.0",
		"gcc-8.2.0",
		"gcc-8.1.0",
		"gcc-7.3.0",
		"gcc-7.2.0",
		"gcc-7.1.0",
		"gcc-6.3.0",
		"gcc-6.2.0",
		"gcc-6.1.0",
		"gcc-5.5.0",
		"gcc-5.4.0",
		"gcc-5.3.0",
		"gcc-5.2.0",
		"gcc-5.1.0",
		"gcc-4.9.3",
		"gcc-4.9.2",
		"gcc-4.9.1",
		"gcc-4.9.0",
		"gcc-4.8.5",
		"gcc-4.8.4",
		"gcc-4.8.3",
		"gcc-4.8.2",
		"gcc-4.8.1",
		"gcc-4.7.4",
		"gcc-4.7.3",
		"gcc-4.6.4",
		"gcc-4.5.4",
		"gcc-4.4.7",
		"clang-head",
		"clang-11.1.0",
		"clang-10.0.0",
		"clang-9.0.0",
		"clang-8.0.0",
		"clang-7.0.0",
		"clang-6.0.1",
		"clang-6.0.0",
		"clang-5.0.0",
		"clang-4.0.1",
		"clang-4.0.0",
		"clang-3.9.1",
		"clang-3.8.1",
		"clang-3.7.1",
		"clang-3.6.0",
		"clang-3.5.0",
		"clang-3.4",
		"clang-3.3",
		"clang-3.2",
		"clang-3.1",
		"zapcc-2017.08",
		"zapcc-1.0.1",
	},
	cmake = { "cmake-head" },
	coffeescript = {
		"coffeescript-head",
		"coffeescript-1.12.7",
		"coffeescript-1.12.6",
		"coffeescript-1.12.3",
		"coffeescript-1.11.1",
		"coffeescript-1.10.0",
	},
	crystal = {
		"crystal-head",
		"crystal-1.0.0",
		"crystal-0.24.1",
		"crystal-0.23.1",
		"crystal-0.22.0",
		"crystal-0.21.1",
		"crystal-0.20.5",
	},
	d = {
		"dmd-head",
		"dmd-2.076.0",
		"dmd-2.074.1",
		"dmd-2.073.0",
		"dmd-2.069.2",
		"gdc-head",
		"ldc-head",
		"ldc-1.4.0",
		"ldc-1.2.0",
		"ldc-1.1.1",
	},
	elixir = {
		"elixir-head",
		"elixir-1.7.1",
		"elixir-1.6.6",
		"elixir-1.6.0",
		"elixir-1.5.2",
		"elixir-1.5.1",
		"elixir-1.5.0",
		"elixir-1.4.5",
		"elixir-1.4.1",
		"elixir-1.3.4",
	},
	erlang = {
		"erlang-head",
		"erlang-21.2",
		"erlang-21.0",
		"erlang-20.1",
		"erlang-20.0",
		"erlang-19.2",
		"erlang-18.3",
		"erlang-17.5",
	},
	fs = {
		"fsharp-head",
		"fsharp-4.1.34",
		"fsharp-4.1.25",
		"fsharp-4.0.0.4",
		"fsharp-3.1.1.26",
	},
	go = {
		"go-head",
		"go-1.14.2",
		"go-1.14.1",
		"go-1.14",
		"go-1.13.10",
		"go-1.13.9",
		"go-1.13.8",
		"go-1.13.7",
		"go-1.13.6",
		"go-1.13.5",
		"go-1.13.4",
		"go-1.13.3",
		"go-1.13.2",
		"go-1.13.1",
		"go-1.13",
		"go-1.12.17",
		"go-1.12.16",
		"go-1.12.15",
		"go-1.12.14",
		"go-1.12.13",
		"go-1.12.12",
		"go-1.12.11",
		"go-1.12.10",
		"go-1.12.9",
		"go-1.12.8",
		"go-1.12.7",
		"go-1.12.6",
		"go-1.11.13",
		"go-1.11.12",
		"go-1.11.11",
		"go-1.11.1",
		"go-1.11",
		"go-1.10",
		"go-1.9",
		"go-1.8.3",
		"go-1.8",
		"go-1.7.5",
		"go-1.6.3",
		"go-1.5.4",
	},
	groovy = {
		"groovy-3.0.7",
		"groovy-2.5.14",
		"groovy-2.4.21",
		"groovy-2.4.11",
		"groovy-2.4.8",
	},
	haskell = {
		"ghc-head",
		"ghc-8.4.2",
		"ghc-8.2.1",
		"ghc-8.0.2",
		"ghc-7.10.3",
		"ghc-7.8.3",
		"ghc-7.6.3",
	},
	java = {
		"openjdk-head",
		"openjdk-jdk-11+28",
		"openjdk-jdk-10+23",
		"openjdk-jdk-10+13",
		"openjdk-jdk-9+181",
		"openjdk-jdk-9+175",
		"openjdk-jdk-9+155",
		"openjdk-jdk8u121-b13",
		"openjdk-jdk7u121-b00",
	},
	javascript = {
		"nodejs-head",
		"nodejs-14.0.0",
		"nodejs-13.13.0",
		"nodejs-12.16.2",
		"nodejs-11.15.0",
		"nodejs-10.20.1",
		"nodejs-10.16.0",
		"nodejs-8.9.0",
		"nodejs-8.6.0",
		"nodejs-8.1.2",
		"nodejs-7.5.0",
		"nodejs-6.11.0",
		"nodejs-6.9.5",
		"nodejs-5.12.0",
		"nodejs-4.7.3",
		"spidermonkey-45.0.2",
		"spidermonkey-38.2.1.rc0",
		"spidermonkey-31.2.0.rc0",
		"spidermonkey-24.2.0",
	},
	julia = { "julia-head", "julia-1.6.0", "julia-1.5.3", "julia-1.0.5" },
	lazyk = { "lazyk" },
	lisp = {
		"clisp-2.49",
		"sbcl-head",
		"sbcl-1.3.18",
		"sbcl-1.3.15",
		"sbcl-1.2.16",
	},
	lua = {
		"lua-5.4.0",
		"lua-5.3.4",
		"lua-5.3.0",
		"lua-5.2.2",
		"luajit-head",
		"luajit-2.0.5",
		"luajit-2.0.4",
		"luajit-2.0.3",
		"luajit-2.0.2",
	},
	nim = {
		"nim-head",
		"nim-1.4.6",
		"nim-1.4.4",
		"nim-1.4.2",
		"nim-1.4.0",
		"nim-1.2.8",
		"nim-1.2.6",
		"nim-1.2.4",
		"nim-1.2.2",
		"nim-1.2.0",
		"nim-1.0.10",
		"nim-1.0.8",
		"nim-1.0.6",
		"nim-1.0.4",
		"nim-1.0.2",
		"nim-1.0.0",
		"nim-0.20.2",
		"nim-0.20.0",
		"nim-0.19.6",
		"nim-0.19.4",
		"nim-0.19.2",
		"nim-0.19.0",
		"nim-0.18.0",
		"nim-0.17.2",
		"nim-0.17.0",
		"nim-0.16.0",
	},
	ocaml = {
		"ocaml-head",
		"ocaml-4.06.1",
		"ocaml-4.05.0",
		"ocaml-4.04.2",
		"ocaml-4.04.0",
	},
	openssl = {
		"openssl-head",
		"openssl-1.1.0f",
		"openssl-1.1.0e",
		"openssl-1.0.2l",
		"openssl-1.0.2k",
		"openssl-1.0.1u",
		"openssl-1.0.0s",
		"openssl-0.9.8zh",
	},
	php = {
		"php-head",
		"php-7.3.3",
		"php-7.1.6",
		"php-7.1.2",
		"php-5.6.30",
		"php-5.5.6",
	},
	pascal = { "fpc-head", "fpc-3.0.2", "fpc-2.6.4", "fpc-2.6.2" },
	perl = {
		"perl-head",
		"perl-5.34.0",
		"perl-5.32.0",
		"perl-5.30.1",
		"perl-5.30.0",
		"perl-5.28.2",
		"perl-5.27.1",
		"perl-5.26.0",
		"perl-5.25.10",
		"perl-5.24.1",
		"perl-5.22.3",
		"perl-5.20.3",
		"perl-5.18.4",
	},
	pony = { "pony-head", "pony-0.14.0", "pony-0.11.3" },
	python = {
		"cpython-head",
		"cpython-2.7-head",
		"cpython-3.8.0",
		"cpython-3.7.5",
		"cpython-3.6.2",
		"cpython-3.6.1",
		"cpython-3.6.0",
		"cpython-3.5.1",
		"cpython-3.5.0",
		"cpython-3.4.3",
		"cpython-2.7.13",
		"cpython-2.7.3",
		"pypy-head",
		"pypy-7.2.0-3",
		"pypy-7.2.0-2",
		"pypy-5.8.0-3",
		"pypy-5.8.0-2",
		"pypy-5.6.0",
		"pypy-5.5.0",
		"pypy-4.0.1",
		"pypy-2.6.1",
		"pypy-2.1",
	},
	r = { "r-head", "r-3.5.1" },
	rill = { "rill-head" },
	ruby = {
		"ruby-head",
		"ruby-3.0.0",
		"ruby-2.7.2",
		"ruby-2.7.1",
		"ruby-2.6.5",
		"ruby-2.6.1",
		"ruby-2.6.0",
		"ruby-2.5.7",
		"ruby-2.5.1",
		"ruby-2.5.0",
		"ruby-2.4.9",
		"ruby-2.4.4",
		"ruby-2.4.3",
		"ruby-2.4.2",
		"ruby-2.4.1",
		"ruby-2.4.0",
		"ruby-2.3.3",
		"ruby-2.2.6",
		"ruby-2.1.10",
		"ruby-2.0.0-p648",
		"ruby-1.9.3-p551",
		"ruby-1.8.7-p358",
		"mruby-head",
		"mruby-2.0.1",
		"mruby-2.0.0",
		"mruby-1.4.0",
		"mruby-1.3.0",
		"mruby-1.2.0",
		"mruby-1.1.0",
		"mruby-1.0.0",
	},
	rust = { "rust-head", "rust-1.18.0", "rust-1.15.0", "rust-1.7.0" },
	sql = { "sqlite-head", "sqlite-3.19.3", "sqlite-3.17.0", "sqlite-3.8.1" },
	scala = {
		"scala-2.13.x",
		"scala-2.12.x",
		"scala-2.11.x",
		"scala-2.12.2",
		"scala-2.12.1",
		"scala-2.11.8",
	},
	swift = {
		"swift-head",
		"swift-5.0.1",
		"swift-4.0",
		"swift-3.1.1",
		"swift-3.0.2",
		"swift-3.0.1",
		"swift-3.0",
		"swift-2.2.1",
		"swift-2.2",
	},
	typescript = {
		"typescript-3.9.5",
		"typescript-3.8.3",
		"typescript-3.7.5",
		"typescript-3.6.5",
		"typescript-3.5.3",
		"typescript-3.5.1",
		"typescript-3.4.5",
		"typescript-3.4.4",
		"typescript-3.4.3",
		"typescript-3.4.2",
		"typescript-3.4.1",
		"typescript-3.3.3",
		"typescript-3.3.1",
		"typescript-3.2.4",
		"typescript-3.2.2",
		"typescript-3.2.1",
		"typescript-3.1.6",
		"typescript-3.1.5",
		"typescript-3.1.4",
		"typescript-3.1.3",
		"typescript-3.1.2",
		"typescript-3.1.1",
		"typescript-3.0.3",
		"typescript-3.0.1",
		"typescript-2.9.2",
		"typescript-2.9.1",
		"typescript-2.8.4",
		"typescript-2.8.3",
		"typescript-2.8.1",
		"typescript-2.7.2",
		"typescript-2.7.1",
		"typescript-2.6.2",
		"typescript-2.6.1",
		"typescript-2.5.3",
		"typescript-2.5.2",
		"typescript-2.5.1",
		"typescript-2.5.0",
		"typescript-2.4.2",
		"typescript-2.4.1",
		"typescript-2.4.0",
		"typescript-2.3.4",
		"typescript-2.3.3",
		"typescript-2.3.2",
		"typescript-2.3.1",
		"typescript-2.3.0",
		"typescript-2.2.2",
		"typescript-2.2.1",
		"typescript-2.2.0",
		"typescript-2.1.6",
		"typescript-2.1.5",
		"typescript-2.1.4",
		"typescript-2.1.1",
		"typescript-2.0.9",
		"typescript-2.0.8",
		"typescript-2.0.7",
		"typescript-2.0.6",
		"typescript-2.0.3",
		"typescript-2.0.2",
		"typescript-2.0.0",
		"typescript-1.8.9",
		"typescript-1.8.7",
		"typescript-1.8.6",
		"typescript-1.8.5",
		"typescript-1.8.2",
		"typescript-1.8.0",
		"typescript-1.7.5",
		"typescript-1.7.3",
		"typescript-1.6.2",
		"typescript-1.5.3",
		"typescript-1.4.1",
		"typescript-1.3.0",
		"typescript-1.0.1",
		"typescript-1.0.0",
	},
	vim = {
		"vim-head",
		"vim-8.0.0671",
		"vim-8.0.0354",
		"vim-7.4.2367",
		"vim-7.4.1714",
		"vim-7.4.729",
	},
}

local switches = {
	sh = {},
	c = { "warnings", "optimization", "verbose" },
	cs = { "optimization" },
	cp = {
		"warnings",
		"optimization",
		"verbose",
		"sprout",
		"messagepack",
		"warnings",
		"-p",
	},
	cmake = {},
	coffeescript = { "compile only" },
	crystal = {},
	d = {},
	elixir = {},
	erlang = {},
	fs = {},
	go = { "-gcflags '-m'" },
	groovy = {},
	haskell = { "warnings", "optimization" },
	java = {},
	javascript = {},
	julia = {},
	lazyk = {},
	lisp = {},
	lua = {},
	nim = {},
	ocaml = { "jane street core" },
	openssl = {},
	php = {},
	pascal = { "delphi 7 mode" },
	perl = {},
	pony = {},
	python = {},
	r = {},
	rill = {},
	ruby = {},
	rust = {},
	sql = {},
	scala = {},
	swift = {},
	typescript = {},
	vim = {},
}

return {
	compiler_list = compiler_list,
	opitons = switches,
}
