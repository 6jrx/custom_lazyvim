-- C/C++ 语言支持的自定义配置
return {
  -- 添加额外的 Treesitter 解析器
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "make",  -- Makefile 语法高亮
      })
    end,
  },
  
  -- 自定义 clangd 配置选项
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- 增强的 clangd 配置
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--all-scopes-completion",
            "--cross-file-rename",
            "--pch-storage=memory",  -- 使用内存存储预编译头，提高性能
          },
        },
      },
    },
  },
  
  -- Mason 确保安装额外的工具
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clangd",           -- C/C++ LSP 服务器
        "codelldb",         -- C/C++ 调试器
        "cmake-language-server",  -- CMake LSP
        "cmakelang",        -- CMake 格式化工具
      })
    end,
  },
}