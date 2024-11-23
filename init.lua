vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- init.lua
local nvim_lsp = require('lspconfig')

-- Setup for Go
nvim_lsp.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go" },
  root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        importshadow = true,
      },
      staticcheck = true,
    },
  },
})

-- Additional setup for completion and other features
local cmp = require'cmp'

cmp.setup({
  mapping = {
    -- Use Up and Down arrow keys for navigation
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    -- Use Enter to confirm the selection
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = nil,  -- Optionally disable Tab for selection
  },
  sources = {
    { name = 'nvim_lsp' },  -- LSP completion
    { name = 'buffer' },    -- Buffer words completion
    { name = 'path' },      -- File system paths
  }
})

