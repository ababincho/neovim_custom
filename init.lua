local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.swapfile = false
opt.backup = false

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.fs", "*.fsx", "*.fsi" },
  command = "set filetype=fsharp",
})

-- vim.lsp.buf.format({ timeout_ms = 2000 })
-- opt.shell = "powershell"
-- opt.shellcmdflag = "-NoLogo"
-- opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'"
-- opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- opt.shellquote = '\\'
