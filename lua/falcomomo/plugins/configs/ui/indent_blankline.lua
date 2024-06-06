return function()
  vim.opt.list = true

  require("ibl").setup({
    exclude = { filetypes = {
      "dashboard",
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "",
    }
},
  })
end
