-- Keymaps
-- Leader keys are set in options.lua

local keymap = vim.keymap.set

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- LSP (applies to buffers with LSP attached)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})

-- Gitsigns (navigation between hunks)
keymap("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() require("gitsigns").next_hunk() end)
    return "<Ignore>"
end, { expr = true, desc = "Next git hunk" })

keymap("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() require("gitsigns").prev_hunk() end)
    return "<Ignore>"
end, { expr = true, desc = "Previous git hunk" })
