-- local M = {}
local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.rustfmt.with {
    extra_args = { "--edition=2021" },
  },
  -- https://dprint.dev/
  -- b.formatting.dprint,
  b.formatting.goimports,
  -- b.formatting.goimports_reviser,
  -- b.formatting.gofmts,
  b.formatting.yamlfmt,
  -- webdev stuff
  -- b.formatting.deno_fmt,
  -- b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- b.formatting.crates,

  -- Shell
  -- b.formatting.shfmt,
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local null_ls = require('null-ls')
-- require('crates').setup {
-- ...
-- null_ls = {
-- enabled = true,
-- name = "crates.nvim",
-- },
-- }
-- null_ls.setup {
-- debug = true,
-- sources = sources,
-- }
-- return M

-- require("null-ls").setup({
-- you can reuse a shared lspconfig on_attach callback here
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}

-- local null_ls = require "null-ls"
-- require("crates").setup {
-- ...
-- null_ls = {
-- enabled = true,
-- name = "crates.nvim",
-- },
-- }
