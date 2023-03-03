local m = require("mapx")

-- Neotree
nnoremap("<leader>e", ":NeoTreeRevealToggle<cr>", "File Tree")

-- Telescope
m.nname("<leader>t", "Telescope")

nnoremap("<leader>tf", ":Telescope find_files<cr>", "Find File")
nnoremap("<leader>tw", ":Telescope live_grep<cr>", "Find Word")
