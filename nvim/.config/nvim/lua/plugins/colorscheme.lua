return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        -- style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      })
    end,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },

  -- -- Cyberdream - High-contrast, futuristic & vibrant theme
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = true,
  --   opts = {
  --     -- Configuración opcional
  --     transparent = false,
  --     italic_comments = true,
  --     hide_fillchars = false,
  --     borderless_telescope = true,
  --   },
  -- },

  -- Nightfox - Highly customizable theme with multiple styles
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  -- Sonokai - High contrast & vivid color scheme based on Monokai Pro
  {
    "sainnhe/sonokai",
    lazy = true,
    init = function()
      vim.g.sonokai_style = "default" -- Opciones: default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_enable_italic = 1
    end,
  },

  -- Material - Material colorscheme with multiple styles
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    init = function()
      vim.g.material_style = "deep ocean" -- Opciones: darker, lighter, oceanic, palenight, deep ocean
    end,
    config = function()
      require("material").setup({
        contrast = {
          terminal = false,
          sidebars = true,
          floating_windows = true,
          cursor_line = true,
        },
        styles = {
          comments = { italic = true },
          functions = { bold = true },
        },
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "telescope",
          "which-key",
          "nvim-tree",
        },
      })
    end,
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
