local m = require("mapx")

m.nmap("<leader>v", ":vsplit | wincmd l<cr>", "Vertical Split")
m.nmap("<leader>h", ":split | wincmd k<cr>", "Horizontal Split")
