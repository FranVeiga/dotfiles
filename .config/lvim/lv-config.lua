-- general

lvim.format_on_save = true
lvim.builtin.compe.autocomplete = true
lvim.colorscheme = "tokyonight"
lvim.auto_close_tree = 0
vim.cmd("set wrap")
vim.cmd("set timeoutlen=200")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autochdir")
vim.cmd('set whichwrap="b,s"')
vim.cmd("set nu rnu")

lvim.leader = "space"


-- keymappings
require("utils").add_keymap_insert_mode({ silent = true }, {
{ "kk", "<ESC>" },
})


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- python
-- lvim.python.linter = 'flake8'
lvim.lang.python.isort = true

-- to change default formatter from yapf to black
-- lvim.lang.python.formatter.exe = "black"
-- lvim.lang.python.formatter.args = {"-"}




-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {"folke/tokyonight.nvim"},

    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },


    -- Pandoc
  {
    "vim-pandoc/vim-pandoc",
    config = function()
      vim.g['pandoc#folding#level'] = 5 -- Disable folding

      vim.g['pandoc#folding#fold_yaml'] = 1 -- Disable conceal
      vim.g['pandoc#folding#foldlevel_yaml'] = 1

      vim.g['pandoc#syntax#conceal#use'] = 1 -- Set the pdfengine from xelatex to xelatex

      vim.g['pandoc#command#latex_engine'] = 'xelatex' -- Set the pdfengine from xelatex to xelatex

      vim.g['pandoc#compiler#arguments'] = "--highlight-style=/home/franveiga/.config/pandoc/themes/my.theme" -- Set the arguments for compiling a document
      vim.api.nvim_exec([[
        augroup My-Pandoc
            autocmd FileType pandoc set textwidth=80
            autocmd FileType pandoc set nospell
            autocmd FileType pandoc set fo+=t
        augroup END
      ]], false)
    end
  }, {"vim-pandoc/vim-pandoc-syntax"},


  -- Surround
  {"tpope/vim-surround"},


  {"vimwiki/vimwiki",
    config = function()
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_folding = 'syntax'
        vim.o.foldlevel = 99
    end
  },
}


-- Additional Leader bindings for WhichKey
-- local additional_mappings = {
lvim.builtin.which_key.on_config_done = function()
require "which-key".register({
    o = {
        name = "+Window",

        v = {"<cmd>vsplit<cr>", "Vertical Split"},
        s = {"<cmd>split<cr>", "Horizontal Split"},

        c = {"<C-w>q", "Close window"},
        T = {"<C-w>T", "Break out"},

    },
    b = {
        c = {"<cmd>BufferClose<cr>", "BufferClose"},
        k = {"<cmd>bdel<cr>", "Kill"},
        },


    w = {
        name = "+Wiki",
        w = {"Index"},
        i = {"Diary index"},
        t = {"Tab index"},
        s = {"UI select"},
        d = {"Delete file"},
        h = {"Vimwiki2HTML"},
        n = {"Go to"},
        r = {"Rename file"},

        T = {"<cmd>VimwikiTOC<cr>", "Table of Contents"},
        e = {"<cmd>!pandoc -f vimwiki -t pdf -o %:p:r.pdf %<cr>", "Export to Pdf"},

        ["<space>"] = {
            name = "+Diary",
            w = "Today note",
            t = "Today note in a new tab",
            m = "Tomorrow note",
            y = "Yesterday note",
            i = "Generate links",
        },
    },
    m = {
    name = "+Pandoc",
    e = {"<cmd>Pandoc pdf<cr>", "Export to Pdf"}

    },
}, lvim.builtin.which_key.opts)
end



