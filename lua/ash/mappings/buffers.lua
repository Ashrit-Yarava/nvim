local m = require("mapx")

m.nname("<leader>w", "Windows")
nnoremap("<leader>wv", ":vsplit | wincmd l<cr>", "Vertical Split")
nnoremap("<leader>wh", ":split | wincmd k<cr>", "Horizontal Split")
