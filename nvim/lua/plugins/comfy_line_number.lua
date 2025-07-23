return {
  'mluders/comfy-line-numbers.nvim',
  lazy = false,
  config = function()
    require('comfy-line-numbers').setup({
      -- 自定义行号标签（映射到实际相对行号）
      up_key = 'j',       -- 向上移动按键
      down_key = 'k',     -- 向下移动按键
      hidden_file_types = { 'undotree' },
      hidden_buffer_types = { 'terminal' }
    })  -- 注意这里的闭合括号缩进，与 setup(...) 对齐
  end  -- 确保 config 函数正确闭合
}
