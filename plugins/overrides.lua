local M = {}

M.nvimtree = {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    side = "right",
  },
  renderer = {
    highlight_git = true,
    -- highlight_opened_files = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "gopls",
    "goimports",
  },
}

return M
