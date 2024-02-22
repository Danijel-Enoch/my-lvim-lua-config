-- Additional Plugins
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

configs.solidity = {
 default_config = {
 cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
 filetypes = { 'solidity' },
 root_dir = lspconfig.util.find_git_ancestor,
 single_file_support = true,
 },
}
lvim.plugins = {
{
  'Exafunction/codeium.vim',
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
},
  { 'TovarishFin/vim-solidity'},
  { "lewis6991/hover.nvim",
  config= function ()
      
    require("hover").setup {
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
        end,
        preview_opts = {
                border = 'single'
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true,
            mouse_providers = {
                'LSP'
            },
            mouse_delay = 1000
    }
       -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
        vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

        -- Mouse support
  end},
  -- https://github.com/jose-elias-alvarez/typescript.nvim
  {'akinsho/toggleterm.nvim', version = "*", config = true}
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
  -- "christianchiarulli/nvim-ts-rainbow",
  -- "karb94/neoscroll.nvim",
}
