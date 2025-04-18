local opts = {
  settings = {
    intelephense = { phpdoc = { returnVoid = false } }
  }
}
require("lvim.lsp.manager").setup("intelephense", opts)
