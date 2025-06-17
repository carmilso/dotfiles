# Neovim configuration

This is my full **Neovim** setup written in Lua and based on the
[LazyVim](https://github.com/LazyVim/LazyVim) starter template.  All files live
under `nvim/.config/nvim` so that the folder can be symlinked directly into
`~/.config`.

Highlights:

* Plugin management powered by **lazy.nvim** with a pre-generated `lazy-lock.json`.
* LSP powered completion (nvim-cmp), linting and formatting.
* Telescope, Treesitter, Gitsigns, Harpoon and many other quality plugins.
* Catppuccin colour scheme out-of-the-box.

The entry point is `init.lua`; supporting modules live inside the `lua/` tree.
