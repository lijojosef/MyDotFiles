return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      metals = {
        cmd = { "metals" },
        filetypes = { "scala", "sbt" },
      },
    },
  },
}

