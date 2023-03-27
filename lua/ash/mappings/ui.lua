local m = require("mapx")

m.nname("<leader>u", "UI")

m.nmap("<leader>um", ":Mason<cr>", "Mason")
m.nmap("<leader>ul", ":Lazy<cr>", "Lazy")
m.nmap("<leader>uL", ":LspInfo<cr>", "Lsp Info")
m.nmap("<leader>un", ":NullLsInfo<cr>", "Null LSP")
