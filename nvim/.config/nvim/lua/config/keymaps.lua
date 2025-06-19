-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Restore default behavior of `s` key
vim.keymap.del("n", "s")

vim.api.nvim_set_keymap("n", "<C-c>", [[:%y+<CR>]], { desc = "Copy file to clipboard" })

-- Only use gj and gk when typing <C-j> and <C-k>
vim.api.nvim_set_keymap("n", "j", "'j'", { desc = "Down", expr = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "'k'", { desc = "Up", expr = true, silent = true })

-- Copy to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Move to next/previous buffer
vim.api.nvim_set_keymap("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

vim.api.nvim_set_keymap("n", "gp", "`[v`]", { desc = "Select last paste" })

-- Quick resize pane
vim.api.nvim_set_keymap("n", "<C-A-h>", "5<C-w>>", { desc = "Window increase width by 5" })
vim.api.nvim_set_keymap("n", "<C-A-l>", "5<C-w><", { desc = "Window decrease width by 5" })
vim.api.nvim_set_keymap("n", "<C-A-k>", "5<C-w>+", { desc = "Window increase height by 5" })
vim.api.nvim_set_keymap("n", "<C-A-j>", "5<C-w>-", { desc = "Window decrease height by 5" })

vim.api.nvim_set_keymap("n", "H", "H", { desc = "Move to top of visible window", noremap = true })
vim.api.nvim_set_keymap("n", "L", "L", { desc = "Move to bottom of visible window", noremap = true })

-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
-- Convert previous command to correct syntax in command mode
vim.api.nvim_set_keymap(
  "c",
  "%%",
  "getcmdtype() == ':' ? expand('%:h').'/' : '%%'",
  { expr = true, desc = "Expand current file path" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ws",
  "<cmd>w !pkexec tee % > /dev/null<cr>",
  { noremap = true, silent = true, desc = "Save as root" }
)
