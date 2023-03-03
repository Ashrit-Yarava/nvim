local m = require("mapx")

nmap("q", ":q<cr>", "Close")
nmap("<C-s>", ":w<cr>", "Save")
nmap("<D-v>", "p", "Paste")
vmap("<D-c>", "y", "Copy")
