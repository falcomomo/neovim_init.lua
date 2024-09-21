return function()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.ensure_installed({
        'pyright',
        'ruff_lsp',
        'lua_ls',
        'omnisharp',
        'jsonls'
    })


    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })

    --cmp_mappings['<Tab>'] = nil
    --cmp_mappings['<S-Tab>'] = nil

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        }
    })

    lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, opts )
        vim.keymap.set("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, opts)
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = false
    })
    local pid = vim.fn.getpid()

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
    --require'lspconfig'.omnisharp.setup {
        --cmd = { "c:/Users/StevenFalconer/AppData/Roaming/Code/User/globalStorage/ms-dotnettools.vscode-dotnet-runtime/.dotnet/8.0.4~x64/dotnet.exe", "C:/bin/omnisharp/OmniSharp.dll"},

        --settings = {
            --FormattingOptions = {
                ---- Enables support for reading code style, naming convention and analyzer
                ---- settings from .editorconfig.
                --EnableEditorConfigSupport = true,
                ---- Specifies whether 'using' directives should be grouped and sorted during
                ---- document formatting.
                --OrganizeImports = nil,
            --},
            --MsBuild = {
                ---- If true, MSBuild project system will only load projects for files that
                ---- were opened in the editor. This setting is useful for big C# codebases
                ---- and allows for faster initialization of code navigation features only
                ---- for projects that are relevant to code that is being edited. With this
                ---- setting enabled OmniSharp may load fewer projects and may thus display
                ---- incomplete reference lists for symbols.
                --LoadProjectsOnDemand = true,
            --},
            --RoslynExtensionsOptions = {
                ---- Enables support for roslyn analyzers, code fixes and rulesets.
                --EnableAnalyzersSupport = nil,
                ---- Enables support for showing unimported types and unimported extension
                ---- methods in completion lists. When committed, the appropriate using
                ---- directive will be added at the top of the current file. This option can
                ---- have a negative impact on initial completion responsiveness,
                ---- particularly for the first few completion sessions after opening a
                ---- solution.
                --EnableImportCompletion = nil,
                ---- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                ---- true
                --AnalyzeOpenDocumentsOnly = nil,
            --},
            --Sdk = {
                ---- Specifies whether to include preview versions of the .NET SDK when
                ---- determining which version to use for project loading.
                --IncludePrereleases = true,
            --},
        --},
    --}
end
