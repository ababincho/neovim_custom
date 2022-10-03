local overrides = require "custom.plugins.overrides"
-- local null_ls = require "null-ls.nvim"

return {

  ----------------------------------------- default plugins ------------------------------------------
  -- override default plugin
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- we are just modifying lspconfig's packer definition table
  -- put this in your custom plugins section i.e M.plugins field

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrides
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ----------------------------------------- custom plugins --------------------------------------------

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Cargo.toml check
  ["saecki/crates.nvim"] = {
    -- tag = "v0.2.1",
    -- after = "null-ls",
    event = { "BufRead Cargo.toml" },
    -- requires = { { "nvim-lua/plenary.nvim" } },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- local null_ls = require "null-ls"
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },

  ["machakann/vim-sandwich"] = {},

  ["itchyny/calendar.vim"] = {},
}
