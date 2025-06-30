require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })
map("n", "<Tab>", ">gv", { desc = "Indent selection" })
map("n", "<S-Tab>", "<gv", { desc = "Outdent selection" })


-- Remove word --
map('i', '<C-BS>', '<C-W>', { noremap = true, silent = true })
map('i', '<C-Del>', '<Esc>dw_a', { noremap = true, silent = true })


-- Comment/uncomment по Ctrl + /
map("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment line", noremap = true, silent = true })

map("x", "<C-/>", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment visual", noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
