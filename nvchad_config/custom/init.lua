local opt = vim.opt             -- global/buffer/windows-scoped options

opt.relativenumber = true           -- Вкл. относительную нумерацию строк
opt.so=12                           -- Курсор всегда в центре экрана
-- local autocmd = vim.api.nvim_create_autocmd 

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end,
})
