local m = require("mapx")

-- Neotree
m.nmap("<leader>e", ":NeoTreeRevealToggle<cr>", "File Tree")

-- Telescope
m.nname("<leader>t", "Telescope")

m.nmap("<leader>tf", ":Telescope find_files<cr>", "Find File")
m.nmap("<leader>tw", ":Telescope live_grep<cr>", "Find Word")
m.nmap("<leader>tc", ":Telescope colorscheme<cr>", "Colorscheme")

m.nmap("<leader>b", ":Telescope buffers<cr>", "Switch to buffer")
