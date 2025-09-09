-- Makefile 增强支持
return {
  -- 添加 Makefile 相关的 Treesitter 解析器
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "make",     -- Makefile 语法高亮
        "bash",     -- Shell 脚本支持（Makefile 中常用）
      })
    end,
  },
  
  -- 为 Makefile 添加便捷快捷键
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "make", icon = "" },
        { "<leader>mm", "<cmd>!make<cr>", desc = "Run make" },
        { "<leader>mc", "<cmd>!make clean<cr>", desc = "Run make clean" },
        { "<leader>mr", "<cmd>!make run<cr>", desc = "Run make run" },
        { "<leader>mt", "<cmd>!make test<cr>", desc = "Run make test" },
        { "<leader>mi", "<cmd>!make install<cr>", desc = "Run make install" },
      },
    },
  },
  
  -- 添加 vim-dispatch 支持异步运行 make 命令
  {
    "tpope/vim-dispatch",
    lazy = true,
    cmd = { "Dispatch", "Make", "Focus", "Start" },
    keys = {
      { "<leader>mM", "<cmd>Make<cr>", desc = "Run Make (async)" },
      { "<leader>mD", "<cmd>Dispatch<cr>", desc = "Dispatch command" },
    },
  },
  
  -- 添加 overseer.nvim 任务运行器（可选，功能更强大）
  {
    "stevearc/overseer.nvim",
    lazy = true,
    cmd = {
      "OverseerToggle",
      "OverseerRun",
      "OverseerBuild",
      "OverseerClose",
      "OverseerLoadTask",
    },
    keys = {
      { "<leader>mo", "<cmd>OverseerToggle<cr>", desc = "Overseer toggle" },
      { "<leader>mR", "<cmd>OverseerRun<cr>", desc = "Overseer run" },
      { "<leader>mb", "<cmd>OverseerBuild<cr>", desc = "Overseer build" },
    },
    opts = {
      templates = { "builtin", "user.make" },
      task_list = {
        direction = "bottom",
        min_height = 10,
        max_height = 15,
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)
      
      -- 自动检测 Makefile 任务
      vim.api.nvim_create_user_command("OverseerLoadTask", function()
        require("overseer").load_task_bundle("make")
      end, {})
    end,
  },
}