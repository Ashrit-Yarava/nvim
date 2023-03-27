local M = {}

local lsp_attach = function(_, _)
	local m = require("mapx")

	m.nname("<leader>l", "LSP")

	local prefix = "<leader>l"

	-- All LSP Mappings are mapped to l.
	m.nmap(prefix .. "h", ":Lspsaga hover_doc<cr>", "Hover")

	m.nmap(prefix .. "a", ":Lspsaga code_action<cr>", "Code Action")

	m.nmap(prefix .. "r", ":Lspsaga rename<cr>", "File Rename")
	m.nmap(prefix .. "R", ":Lspsaga rename ++project<cr>", "Project Rename")

	m.nmap(prefix .. "s", ":Lspsaga peek_definition<cr>", "Peek Definition")
	m.nmap(prefix .. "S", ":Lspsaga goto_definition<cr>", "Goto Definition")

	m.nmap(prefix .. "t", ":Lspsaga peek_type_definition<cr>", "Peek Type Definition")
	m.nmap(prefix .. "T", ":Lspsaga goto_type_definition<cr>", "Goto Type Definition")

	m.nmap(prefix .. "l", ":Lspsaga show_line_diagnostics<cr>", "Line Diagnostics")
	m.nmap(prefix .. "c", ":Lspsaga show_cursor_diagnostics<cr>", "Cursor Diagnostics")
	m.nmap(prefix .. "b", ":Lspsaga show_buf_diagnostics<cr>", "Buffer Diagnostics")

	m.nmap("[d", ":Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic")
	m.nmap("]d", ":Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic")

	m.nmap(prefix .. "f", ":lua vim.lsp.buf.format({ async = true })<cr>", "Format")

	-- Mappings for trouble.

	require("ash.mappings.trouble")
end

function M.setup()
	vim.opt.signcolumn = "yes"

	local lsp = require("lsp-zero").preset({
		name = "recommended",
		set_lsp_keymaps = false,
		manage_nvim_cmp = true,
		suggest_lsp_servers = true,
	})

	lsp.setup_nvim_cmp({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "path" },
		},
		documentation = {
			max_height = 15,
			max_width = 60,
			border = "rounded",
			col_offset = 0,
			side_padding = 1,
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
			zindex = 1001,
		},
	})

	lsp.on_attach(lsp_attach)
	lsp.nvim_workspace()

	lsp.setup()

	local cmp = require("cmp")
	local cmp_config = lsp.defaults.cmp_config({
		window = {
			completion = cmp.config.window.bordered(),
		},
		formatting = {
			format = require("lspkind").cmp_format(),
		},
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						cmp.confirm()
					end
				else
					fallback()
				end
			end, { "i", "s", "c" }),
		},
	})

	cmp.setup(cmp_config)

	local null_ls = require("null-ls")
	local null_opts = lsp.build_options("null-ls", {})

	null_ls.setup({
		on_attach = function(client, bufnr)
			null_opts.on_attach(client, bufnr)
		end,
		sources = {
			-- You can add tools not supported by mason.nvim
		},
	})

	-- See mason-null-ls.nvim's documentation for more details:
	-- https://github.com/jay-babu/mason-null-ls.nvim#setup
	require("mason-null-ls").setup({
		ensure_installed = nil,
		automatic_installation = false, -- You can still set this to `true`
		automatic_setup = true,
	})

	-- Required when `automatic_setup` is true
	require("mason-null-ls").setup_handlers()

	-- Setup LSP Signature Help
	require("lsp_signature").setup({
		bind = true,
		hint_prefix = "󰏫 ",
		handler_opts = {
			border = "rounded",
		},
	})
end

return M
