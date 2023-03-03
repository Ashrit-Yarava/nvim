local M = {}

local lsp_attach = function(_, _)

  local m = require("mapx")

  m.nname("<leader>l", "LSP")

  nnoremap("<leader>ld", vim.diagnostic.open_float, "Diagnostic")
  nnoremap("<leader>la", vim.lsp.buf.code_action, "Code Action")
  nnoremap("<leader>lh", vim.lsp.buf.hover, "Hover")
  nnoremap("<leader>lf", function () vim.lsp.buf.format({ async = true }) end, "Format")
  nnoremap("<leader>ld", vim.lsp.buf.definition, "Definition")
  nnoremap("<leader>lD", vim.lsp.buf.declaration, "Declaration")
  nnoremap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
  nnoremap("<leader>lr", vim.lsp.buf.rename, "Rename")
  nnoremap("<leader>lR", vim.lsp.buf.references, "References")
  nnoremap("<leader>l[", vim.diagnostic.goto_prev, "Previous Diagnostic")
  nnoremap("<leader>l]", vim.diagnostic.goto_next, "Next Diagnostic")

end

function M.setup()

  vim.opt.signcolumn = 'yes'

  local lsp = require("lsp-zero").preset({
    name = "recommended",
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true
  })

  lsp.on_attach(lsp_attach)
  lsp.nvim_workspace()

  lsp.setup()

  local cmp = require('cmp')
  local cmp_config = lsp.defaults.cmp_config({
    window = {
      completion = cmp.config.window.bordered()
    }
  })

  cmp.setup(cmp_config)

end

return M
