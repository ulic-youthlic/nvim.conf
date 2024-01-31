if vim.g.vscode then
    return {}
end
local M = {}
local theme = {}
local opt = {
    contrast = {
        terminal = true,            -- Enable contrast for the built-in terminal
        sidebars = true,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true,    -- Enable contrast for floating windows
        cursor_line = true,         -- Enable darker background for the cursor line
        non_current_windows = true, -- Enable contrasted background for non-current windows
        filetypes = {},             -- Specify which filetypes get the contrasted (darker) background
    },
    styles = {                      -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { bold = true },
        keywords = { underline = false },
        functions = { bold = true, undercurl = false },
        variables = {},
        operators = {},
        types = {},
    },
    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        "fidget",
        -- "flash",
        "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        "indent-blankline",
        "lspsaga",
        "mini",
        -- "neogit",
        -- "neotest",
        "neo-tree",
        -- "neorg",
        -- "noice",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        "nvim-web-devicons",
        "rainbow-delimiters",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
        "nvim-notify",
    },
    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false,        -- Disable borders between verticaly split windows
        background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false,    -- Prevent the theme from setting terminal colors
        eob_lines = false       -- Hide the end-of-buffer lines
    },
    high_visibility = {
        lighter = false,       -- Enable higher contrast text for lighter style
        darker = false         -- Enable higher contrast text for darker style
    },
    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)
    custom_colors = nil,       -- If you want to override the default colors, set this to a function
    custom_highlights = {
        DiagnosticUnderlineError = {
            fg = [[Red]],
            undercurl = true,
        },
        DiagnosticUnderlineWarn = {
            fg = [[Orange]],
            underline = true,
        },
        DiagnosticUnderlineInfo = {
            fg = [[LightBlue]],
            underline = true,
        },
        DiagnosticUnderlineHint = {
            fg = [[Purple]],
            underline = true,
        },
        DisgnosticUnderlineOk = {
            fg = [[LightGreen]],
            underline = true,
        },
    }, -- Overwrite highlights with your own
}
local prefix = "plugins.appearance"

theme[1] = [[marko-cerovac/material.nvim]]
theme.config = function()
    require('material').setup(opt)
    require("material.functions").change_style("deep ocean")
end
theme.dependencies = {
    require("plugins.appearance.indent")
}

M[1] = theme
M[2] = require(prefix .. [[.icons]])
M[3] = require(prefix .. [[.gitsigns]])
M[4] = require(prefix .. [[.notify]])
M[5] = require(prefix .. [[.scrollview]])
M[6] = require(prefix .. [[.trouble]])
M[7] = require(prefix .. [[.lualine]])
M[8] = require(prefix .. [[.mini-cursorword]])

return M
