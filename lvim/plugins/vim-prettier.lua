return {
  "prettier/vim-prettier",
  config = function()
    vim.g["prettier#config#semi"] = true
    vim.g["prettier#config#line_width"] = 100
    vim.g["prettier#config#print_width"] = 100
    vim.g["prettier#config#single_quote"] = true
    vim.g["prettier#config#trailing_comma"] = "es5"
    vim.g["prettier#config#bracket_spacing"] = true
    lvim.format_on_save.pattern = { "*.lua", "*.py", "*.ts", "*.tsx" }
    lvim.format_on_save.enabled = true
  end,
}
