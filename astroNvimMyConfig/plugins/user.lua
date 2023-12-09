return {
  "savq/paq-nvim", -- Let Paq manage itself
  "neovim/nvim-lspconfig",
  { "lervag/vimtex", opt = true }, -- Use braces when passing options
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}

  -- vim.g.nvim_agda_settings = {
  --   agda = "/usr/local/bin/agda",            -- Location of Agda binary
  --   agda_args = { "--arg1", "--arg2"  },     -- Default arguments to Agda binary
  --   debug_p = true,                          -- Turn debug prints on or off
  -- }
