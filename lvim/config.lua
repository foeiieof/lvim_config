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
-- end reload plugi

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
-- lvim.colorscheme = 'framer_syntax_light'
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
-- folding powered by treesitter
-- -- https://github.com/nvim-treesitter/nvim-treesitter#folding
-- -- look for foldenable: https://github.com/neovim/neovim/blob/master/src/nvim/options.lua
-- -- Vim cheatsheet, look for folds keys: https://devhints.io/vim
vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false
lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.treesitter.parser_install_dir("https://github.com/EmranMR/tree-sitter-blade")

-- lvim.builtin.treesitter = {
--   lazy_load = true,
--   cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
--   build = ":TSUpdate",
--   opts = function()
--     return require("plugins.configs.treesitter")
--   end,
--   config = function(_, opts)
--     dofile(vim.g.base46_cache .. "syntax")
--     require("nvim-treesitter.configs").setup(opts)

--     local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--     parser_config.blade = {
--       install_info = {
--         url = "https://github.com/EmranMR/tree-sitter-blade",
--         files = { "src/parser.c" },
--         branch = "main",
--       },
--       filetype = "blade"
--     }
--   end,
-- }

-- vim.filetype.add({
--   pattern = {
--     ['.*%.blade%.php'] = 'blade',
--   },
-- })
-- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
