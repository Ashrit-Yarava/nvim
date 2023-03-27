local m = require("mapx")

m.nname("<leader>x", "Trouble")

m.nmap("<leader>xx", ":TroubleToggle<cr>", "Open Trouble")
m.nmap("<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics")
m.nmap("<leader>xd", ":TroubleToggle document_diagnostics<cr>", "Document Diagnostics")
m.nmap("<leader>xq", ":TroubleToggle quickfix<cr>", "Quickfix")
m.nmap("<leader>xl", ":TroubleToggle loclist<cr>", "LocList")
