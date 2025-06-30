require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local servers = { "html", "cssls" }
vim.lsp.enable(servers)

------------------------------------
-- LSP config hooks ----------------
------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

  -- bindings
  local bufmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
  bufmap("n", "K", vim.lsp.buf.hover, "Hover docs")
  bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  bufmap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", "List diagnostics")
end

------------------------------------
-- Attach custom language servers --
------------------------------------

-- Python (Pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- C/C++ (Clangd)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})

-- Bash (bash-language-server)
lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh", "zsh", "bash" },
  cmd = { "bash-language-server", "start" },
})

