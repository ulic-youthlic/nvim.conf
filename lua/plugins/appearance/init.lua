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
        keywords = { underline = true },
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
        -- "fidget",
        -- "flash",
        "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        "indent-blankline",
        "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neotest",
        -- "neo-tree",
        -- "neorg",
        -- "noice",
        -- "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        "telescope",
        -- "trouble",
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
    custom_highlights = {},    -- Overwrite highlights with your own
}
local prefix = "plugins.appearance"

theme[1] = [[marko-cerovac/material.nvim]]
theme.config = function()
    require('material').setup(opt)
    require("material.functions").change_style("deep ocean")
end

M[1] = theme
M[2] = require(prefix .. [[.icons]])
M[3] = require(prefix .. [[.indent]])
M[4] = require(prefix .. [[.gitsigns]])
M[5] = require(prefix .. [[.notify]])

return M
