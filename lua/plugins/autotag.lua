-- The autotag plugin is used to automatically insert closing tags when you type the opening tag
return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
}
