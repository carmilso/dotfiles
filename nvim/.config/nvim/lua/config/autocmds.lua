-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
--   pattern = { "*.md", "*.tex", "COMMIT_EDITMSG" },
--   callback = function()
--     vim.opt_local.spell = true
--   end,
-- })

-- ---------------------------------------------------------------------------
-- Avante: Generate commit message automatically
-- ---------------------------------------------------------------------------
-- When editing a git commit buffer (COMMIT_EDITMSG) open Avante and prompt it
-- to generate a commit message for the staged changes.

local avante_commit_group = vim.api.nvim_create_augroup("avante_commit_msg", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = avante_commit_group,
  pattern = "COMMIT_EDITMSG",
  callback = function()
    -- We wrap the require in pcall to avoid errors if the plugin hasn't been
    -- loaded for some reason.
    local ok, avante_api = pcall(require, "avante.api")
    if not ok then
      return
    end

    -- Defer the ask call a little so the commit buffer is fully initialised.
    vim.defer_fn(function()
      -- Añadimos el propio COMMIT_EDITMSG a la lista de «selected files» y
      -- lanzamos la petición, centrándonos después en el panel de resultados.

      local commit_filepath = vim.api.nvim_buf_get_name(0)
      local relative_commit_path = require("avante.utils").relative_path(commit_filepath)

      -- Intentamos añadir el fichero; si el sidebar aún no existe, `add_selected_file`
      -- lo abrirá automáticamente.
      pcall(function()
        avante_api.add_selected_file(relative_commit_path)
      end)

      -- Excluir todo el diff de poetry.lock (y las líneas que lo mencionan) del buffer de commit.
      pcall(function()
        local bufnr = 0
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local filtered = {}
        local skipping = false
        for _, l in ipairs(lines) do
          local is_diff = l:match("^diff %-%-git ")
          if is_diff then
            -- inicie bloqueo si es diff para poetry.lock
            skipping = l:match("poetry%.lock") and true or false
          end
          -- saltar líneas de poetry.lock o líneas dentro de su diff
          if not skipping and not (l:match("poetry%.lock") and not is_diff) then
            table.insert(filtered, l)
          end
        end
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, filtered)
      end)

      -- Enviamos la pregunta iniciando un nuevo chat.
      avante_api.ask({
        question = "Generate a concise and descriptive git commit message (in English) for the staged changes that you see in this file. You don't need to run any git tool, just focus on the changes file attached. Use commitizen format for the message. Don't try to commit by yourself. Print the commit message and terminate",
        new_chat = true,
      })

      -- Tras unos milisegundos, movemos el cursor al panel de resultados.
      vim.defer_fn(function()
        local sidebar = require("avante").get()
        if sidebar and sidebar.result_container and sidebar.result_container.winid then
          pcall(vim.api.nvim_set_current_win, sidebar.result_container.winid)
        end
      end, 50)
    end, 100)
  end,
})

-- ---------------------------------------------------------------------------
-- Disable diagnostics for .env* files
-- ---------------------------------------------------------------------------

local env_diagnostics_group = vim.api.nvim_create_augroup("disable_env_diagnostics", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = env_diagnostics_group,
  pattern = ".env*",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = env_diagnostics_group,
  pattern = "config/deploy*.yml",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
