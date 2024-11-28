local util = require 'lspconfig.util'
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "hls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.hls.setup({
        filetypes = {"haskell", "lhaskell",},
        cmd = {"haskell-language-server-wrapper", "--lsp"},
        root_dir = util.root_pattern('stack.yaml', 'package.yaml'),
        settings = {
          haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "fourmolu"
          }
        },
        single_file_support = true
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gtd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
    end,
  },
}
