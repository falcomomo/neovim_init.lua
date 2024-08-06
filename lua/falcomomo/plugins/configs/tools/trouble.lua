return function()
 require("trouble").setup({
    height = 15,
    action_keys = { -- key mappings for actions in the trouble list
      jump = { "o", "<tab>" }, -- jump to the diagnostic or open / close folds
      jump_close = { "<cr>" }, -- jump to the diagnostic and close the list
    },
  })

  vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble", silent = true, noremap = true })
  vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer diagnostics (Trouble)", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    { desc = "Symbols (Trouble)", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xL",
    "<cmd>Trouble loclist toggle<cr>",
    { desc = "Location List (Trouble)", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xQ",
    "<cmd>Trouble qflist toggle<cr>",
    { desc = "Quickfix List (Trouble)", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)", silent = true, noremap = true }
  )
end
