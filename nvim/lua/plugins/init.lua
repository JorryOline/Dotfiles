
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
    {
    "NvChad/ui",
    lazy = false,
    config = function ()
      require "nvchad"
    end,
  },
  {
    "junegunn/fzf",
    lazy = false,
  },
  {
    "andymass/vim-matchup",
    -- Highlight, jump between pairs like if..else
    lazy = true,
    event = { "User FileOpened" },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        notify.setup({
            -- "fade", "slide", "fade_in_slide_out", "static"
            stages = "slide",
            on_open = nil,
            on_close = nil,
            timeout = 3000,
            fps = 144,
            render = "default",
            background_colour = "Normal",
            max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
            max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
            -- minimum_width = 50,
            -- ERROR > WARN > INFO > DEBUG > TRACE
            level = "TRACE",
        })
        local getTime = os.date("%X");
        local output = vim.fn.system("fortune")
        vim.notify = notify
        notify(output, "info", {
          title = "每日箴言 🎲",
          on_open = nil,
          stages = 'slide',
          timeout = "5000",
          fps = 144,
      })
        notify("🥳💖欢迎访问http://jorryoline.github.io喵❤️😘💕",nil,{
	          on_open = nil,
	          render = 'minimal',
	          stages = 'slide',
	          fps = 144,
	          timeout = 1000,
        })
    end,
},
{
    "folke/noice.nvim",
    enabled = enable_noice,
    lazy = true,
    event = "user fileopened",
    dependencies = { "rcarriga/nvim-notify", "muniftanjim/nui.nvim" },
    config = function()
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = false,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
            health = {
                checker = false,
            },
        })
    end,
  },
{
"simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = function()
        local opts = {
            highlight_hovered_item = true,
            show_guides = true,
            auto_preview = false,
            position = "right",
            relative_width = true,
            width = 25,
            auto_close = false,
            show_numbers = false,
            show_relative_numbers = false,
            show_symbol_details = true,
            preview_bg_highlight = "Pmenu",
            autofold_depth = nil,
            auto_unfold_hover = true,
            fold_markers = { "", "" },
            wrap = false,
            keymaps = { -- These keymaps can be a string or a table for multiple keys
                close = { "<Esc>", "q" },
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "r",
                code_actions = "a",
                fold = "h",
                unfold = "l",
                fold_all = "P",
                unfold_all = "U",
                fold_reset = "Q",
            },
            lsp_blacklist = {},
            symbol_blacklist = {},
            symbols = {
                File = { icon = "", hl = "@text.uri" },
                Module = { icon = "", hl = "@namespace" },
                Namespace = { icon = "", hl = "@namespace" },
                Package = { icon = "", hl = "@namespace" },
                Class = { icon = "𝓒", hl = "@type" },
                Method = { icon = "ƒ", hl = "@method" },
                Property = { icon = "", hl = "@method" },
                Field = { icon = "", hl = "@field" },
                Constructor = { icon = "", hl = "@constructor" },
                Enum = { icon = "", hl = "@type" },
                Interface = { icon = "ﰮ", hl = "@type" },
                Function = { icon = "", hl = "@function" },
                Variable = { icon = "", hl = "@constant" },
                Constant = { icon = "", hl = "@constant" },
                String = { icon = "𝓐", hl = "@string" },
                Number = { icon = "#", hl = "@number" },
                Boolean = { icon = "", hl = "@boolean" },
                Array = { icon = "", hl = "@constant" },
                Object = { icon = "", hl = "@type" },
                Key = { icon = "🔐", hl = "@type" },
                Null = { icon = "NULL", hl = "@type" },
                EnumMember = { icon = "", hl = "@field" },
                Struct = { icon = "𝓢", hl = "@type" },
                Event = { icon = "🗲", hl = "@type" },
                Operator = { icon = "+", hl = "@operator" },
                TypeParameter = { icon = "𝙏", hl = "@parameter" },
                Component = { icon = "󰡀", hl = "@function" },
                Fragment = { icon = "", hl = "@constant" },
            },
        }
        require("symbols-outline").setup(opts)
    end,
  },
{
    "nvim-zh/colorful-winsep.nvim",
    lazy = true,
    event = "WinNew",
    config = function()
        require("colorful-winsep").setup({
        hi = {
          bg = "#242532",
          fg = "#242532",
        },
      })
    end,
},
  {
    "HiPhish/nvim-ts-rainbow2",
    -- Bracket pair rainbow colorize
    lazy = true,
    event = { "User FileOpened" },
  },
-- {
--     "romgrk/nvim-treesitter-context",
--     lazy = true,
--     event = { "User FileOpened" },
--     config = function()
--         require("treesitter-context").setup({
--             enable = true,
--             throttle = true,
--             max_lines = 0,
--             patterns = {
--                 default = {
--                     "class",
--                     "function",
--                     "method",
--                 },
--             },
--         })
--     end,
--   },
{
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
        require("todo-comments").setup()
    end,
  },
{
    "zbirenbaum/neodim",
    lazy = true,
    event = "LspAttach",
    config = function()
        require("neodim").setup({
            alpha = 0.75,
            blend_color = "#000000",
            update_in_insert = {
                enable = true,
                delay = 100,
            },
            hide = {
                virtual_text = true,
                signs = false,
                underline = false,
            },
        })
    end,
  },
    {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
},
  {
    'jayli/nvim-ai-coding',
    lazy = false,
  }

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
