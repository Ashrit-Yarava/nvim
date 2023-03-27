local m = require("mapx")

m.nmap("q", ":q<cr>", "Close")
m.nmap("<C-s>", ":w<cr>", "Save")
m.nmap("<D-v>", "p", "Paste")
m.imap("<D-v>", "p", "Paste")
m.vmap("<D-c>", "y", "Copy")
m.nmap("<leader>d", ":bd<cr>", "Close Buffer")
