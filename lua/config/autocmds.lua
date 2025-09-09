-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Makefile 必须使用真正的 tab，不能用空格
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make" },
    callback = function()
        vim.opt_local.expandtab = false  -- 使用真正的 tab
        vim.opt_local.tabstop = 8        -- Makefile 标准是 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
    end,
})
