return function()
    local undotree = require('undotree')
    undotree.setup({})
    vim.keymap.set("n", "<leader>u", function() undotree.toggle() end)
end
