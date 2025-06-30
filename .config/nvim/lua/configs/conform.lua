local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  number = true,
  relativenumber = true,
  signcolumn = "yes",
  wrap = false,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
  expandtab = true,
  smartindent = true,
  autoindent = true,
  cursorline = true,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,
  updatetime = 300,

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
