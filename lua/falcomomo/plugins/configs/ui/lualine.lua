local function cwd() 
    return vim.fn.getcwd()
end

local function nvic()
    local navic = require('nvim-navic')
    return navic.get_location()
end

local function mark_status()
    local marks = vim.fn.getmarklist(vim.fn.bufnr "%")
    local result = {}
    for _, mark in ipairs(marks) do
        if mark.mark:match "[a-z]" then
            table.insert(result, mark.mark)
        end
    end

    return table.concat(result, " ")
end


return function()

    local trouble = require("trouble")
    local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
    })

    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'dracula-nvim',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { cwd, 'branch', 'diff', 'diagnostics', {symbols.get, cond = symbols.has} },
            lualine_c = { {'filename', path=1} },
            lualine_x = { 'harpoon2', mark_status, 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    })
end
