return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre ~/Sync/obsidian/vaults/personal/*.md",
    "BufNewFile ~/Sync/obsidian/vaults/personal/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "informática",
        path = "~/Sync/obsidian/vaults/informática",
      },
      {
        name = "notas",
        path = "~/Sync/obsidian/vaults/notas",
      },
      {
        name = "personal",
        path = "~/Sync/obsidian/vaults/personal",
      },
      {
        name = "work",
        path = "~/Sync/obsidian/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
}
