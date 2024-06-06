return function() 
    require('legendary').setup({ 
        extensions = { lazy_nvim = true },
        keymaps = {
            {
                "<C-S-;>",
                function()
                    require("legendary").find({
                        formatter = function(item, _)
                            -- remove first column
                            local values = require("legendary.ui.format").default_format(item)
                            values[1] = ""
                            return values
                        end,
                    })
                end,
                description = "Legendary Command Palette",
                mode = { "n", "x" },
            },
        }
    })
end
