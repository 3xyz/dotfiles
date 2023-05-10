local opt = vim.opt             -- global/buffer/windows-scoped options

opt.relativenumber = true           -- Вкл. относительную нумерацию строк
opt.so=12                           -- Курсор всегда в центре экрана
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
