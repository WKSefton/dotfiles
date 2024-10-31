return {
	"tpope/vim-dadbod",
	lazy = true,
	cmd = { "DBUI", "DBUIToggle", "DBUIFindBuffer", "DBUIRenameBuffer" }, -- Load for database commands
	dependencies = {
		"kristijanhusak/vim-dadbod-completion",
		"kristijanhusak/vim-dadbod-ui",
	},
}
