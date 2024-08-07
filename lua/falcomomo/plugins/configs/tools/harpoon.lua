return function()
local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED


    vim.keymap.set("n", "<leader><leader>g",function() harpoon:list():add() end, { desc = "Harpoon add"})
    vim.keymap.set("n", "<leader><leader>f", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon list"})

    vim.keymap.set("n", "<leader><leader>j", function() harpoon:list():select(1) end, { desc = "Harpoon list 1" })
    vim.keymap.set("n", "<leader><leader>k", function() harpoon:list():select(2) end, { desc = "Harpoon list 2" })
    vim.keymap.set("n", "<leader><leader>l", function() harpoon:list():select(3) end, { desc = "Harpoon list 3" })
    vim.keymap.set("n", "<leader><leader>;", function() harpoon:list():select(4) end, { desc = "Harpoon list 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end
