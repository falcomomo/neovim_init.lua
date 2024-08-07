local plugins = {
    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = require("ui.dashboard"),
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        -- init = lazyLoad("lualine.nvim"),
        config = require("ui.lualine"),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- Indent blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        config = require("ui.indent_blankline"),
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = require("ui.treesitter"),
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects"
            }
        }
    },
    -- Vim Illuminate
    {
        "RRethy/vim-illuminate",
        event = "BufEnter",
        config = require("ui.vim_illuminate"),
    },
    -- Which Key
    {
        "folke/which-key.nvim",
        config = require("ui.which_key"),
    },
    -- legendary
    {
        "mrjones2014/legendary.nvim",
        config = require("ui.legendary")
    },
    -- Noice
    {
        "folke/noice.nvim",
        config = require("ui.noice"),
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        event = "VeryLazy",
    },
    -- Git Signs
    {
        "lewis6991/gitsigns.nvim",
        config = require("ui.gitsigns"),
    },
    -- TODO Comments
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = require("ui.todo_comments"),
    },
    -- Neo-Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            }
        },
    }
}

return plugins
