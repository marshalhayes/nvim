-- The autopairs plugin is used to automatically insert closing brackets, quotes, etc. when you type the opening character
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
}
