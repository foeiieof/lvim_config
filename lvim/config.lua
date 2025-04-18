-- reload plugin
local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/plugins", "*.lua", false, true)
local local_plugins = {}
for _, file in ipairs(plugin_files) do
  local plugin_config = dofile(file)
  if type(plugin_config) == "table" then
    table.insert(local_plugins, plugin_config)
  end
end
vim.list_extend(lvim.plugins, local_plugins)
vim.opt.termguicolors = true
vim.opt.guicursor = "i:blinkon1-ver100"
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.nav = true
vim.api.nvim_set_hl(0, 'CursorInsert', { fg = "#ff0000", bg = "#ff0000" })
lvim.builtin.alpha.dashboard.section.header.val = function()
  return [[
░▒▓████████▓▒░▒▓██████▓▒░░▒▓████████▓▒░▒▓█▓▒░
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░
░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓█▓▒░
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░
░▒▓█▓▒░      ░▒▓██████▓▒░░▒▓████████▓▒░▒▓█▓▒░

]]
end
vim.cmd("colorscheme pablo")
lvim.keys.insert_mode["<D-i>"] = "<C-c>"
lvim.colorscheme = 'framer_syntax_dark'
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=10 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}
lvim.builtin.cmp.active = true
lvim.keys.normal_mode["A"] = ":m-2<CR>"
lvim.keys.normal_mode["Z"] = ":m+1<CR>"
lvim.keys.normal_mode["<M-w-Left>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<M-w-Right>"] = ":resize -2<CR>"
lvim.keys.normal_mode["F"] = ":Prettier<CR>"
vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp-language-server" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "omnisharp"
end, lvim.lsp.automatic_configuration.skipped_servers)

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "phpactor"
end, lvim.lsp.automatic_configuration.skipped_servers)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  max_file_size = 2000000
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "blade",
}

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
