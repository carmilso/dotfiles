return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    config = function()
      -- NOTE: We explicitly disable tools for the Claude provider. We do this
      -- inside the call to `setup()` so that we don't rely on Lazy's automatic
      -- `opts` forwarding (our custom `config` function would otherwise ignore
      -- it).
      require("avante").setup({
        -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub:get_active_servers_prompt()
        end,

        -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,

        providers = {
          claude = {
            -- disable_tools = true, -- Do not use tools with Claude models
          },
        },
      })
    end,
    -- We pass the complete configuration table directly via the `config` callback,
    -- so there is no need for a separate `opts` field.
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        "ravitemer/mcphub.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
        config = function()
          require("mcphub").setup({
            -- Required options
            port = 3000, -- Port for MCP Hub server
            config = vim.fn.expand("~/.mcpservers.json"), -- Absolute path to config file

            -- Optional options
            on_ready = function(hub)
              -- Called when hub is ready
            end,
            on_error = function(err)
              -- Called on errors
            end,
            shutdown_delay = 0, -- Wait 0ms before shutting down server after last client exits
            log = {
              level = vim.log.levels.WARN,
              to_file = false,
              file_path = nil,
              prefix = "MCPHub",
            },
          })
        end,
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
