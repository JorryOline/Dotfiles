return {
  "stevearc/overseer.nvim",
  lazy =false,
  opts = {
    templates = { "builtin", "user.cpp_run" },
  },
  config = function(_, opts)
    require("overseer").setup(opts)

    -- 定义C++运行任务模板（适配PowerShell）
    require("overseer").register_template({
      name = "cpp_run",
      builder = function()
        local filename = vim.fn.expand("%:t")
        local basename = vim.fn.expand("%:t:r")
        -- Windows下PowerShell的运行命令格式
        local run_cmd = ".\\" .. basename .. ".exe" -- 显式指定.exe扩展名
        
        return {
          cmd = { "pwsh" }, -- 使用PowerShell执行
          -- PowerShell的参数格式：-Command 后跟要执行的命令
          args = { 
            "-Command", 
            string.format(
              "g++ -g %s -o %s; if ($LASTEXITCODE -eq 0) { %s }",
              filename,       -- 源文件
              basename,       -- 输出可执行文件（不带扩展名）
              run_cmd         -- 运行命令（带.exe扩展名）
            ) 
          },
          components = {
            { "on_output_quickfix", open = true }, -- 错误信息输出到quickfix
            "default",
          },
        }
      end,
      condition = {
        filetype = "cpp",
      },
    })

    -- 绑定F5快捷键
    vim.keymap.set("n", "<F5>", "<cmd>OverseerRun<CR>", { desc = "F5: 用PowerShell运行当前C++文件" })
  end,
}

