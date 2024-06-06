return function()
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        },
    },
})

require('lspconfig').pyright.setup({
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

require('lspconfig').omnisharp.setup({
        cmd = { "dotnet", "C:/bin/omnisharp/OmniSharp.dll"},
        settings = {
            FormattingOptions = {
                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                EnableEditorConfigSupport = true,
                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                OrganizeImports = nil,
            },
            MsBuild = {
                -- If true, MSBuild project system will only load projects for files that
                -- were opened in the editor. This setting is useful for big C# codebases
                -- and allows for faster initialization of code navigation features only
                -- for projects that are relevant to code that is being edited. With this
                -- setting enabled OmniSharp may load fewer projects and may thus display
                -- incomplete reference lists for symbols.
                LoadProjectsOnDemand = true,
            },
            RoslynExtensionsOptions = {
                -- Enables support for roslyn analyzers, code fixes and rulesets.
                EnableAnalyzersSupport = nil,
                -- Enables support for showing unimported types and unimported extension
                -- methods in completion lists. When committed, the appropriate using
                -- directive will be added at the top of the current file. This option can
                -- have a negative impact on initial completion responsiveness,
                -- particularly for the first few completion sessions after opening a
                -- solution.
                EnableImportCompletion = true,
                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                -- true
                AnalyzeOpenDocumentsOnly = nil,
        EnableDecompilationSupport = true,
            },
            Sdk = {
                -- Specifies whether to include preview versions of the .NET SDK when
                -- determining which version to use for project loading.
                IncludePrereleases = true,
            },
        },
        --handlers = {
            --["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            --["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            --["textDocument/references"] = require('omnisharp_extended').references_handler,
            --["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
        --},
        on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() require("omnisharp_extended").telescope_lsp_definition({ reuse_win = true }) end, opts )
        vim.keymap.set("n", "gI", function() require("omnisharp_extended").telescope_lsp_implementation({ reuse_win = true }) end, opts)
        vim.keymap.set("n", "gr", function() require("omnisharp_extended").telescope_lsp_references() end, opts)
    end
    }
)
end
