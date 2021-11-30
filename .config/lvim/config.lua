-- general
lvim.format_on_save = true
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
vim.cmd("set completeopt=menu,menuone,noselect")
vim.cmd("set virtualedit=onemore")
lvim.line_wrap_cursor_movement = false
lvim.leader = "space"

-- keymappings
lvim.keys.insert_mode.kk = "<ESC>"
lvim.keys.term_mode["<ESC>"] = "<C-\\><C-n>"
lvim.keys.term_mode.kk = "kk"



-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {"norg"}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.playground.enable = true

-- NVIM-CMP CONFIGURATION
local function T(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require 'cmp'
local luasnip = require 'luasnip'



lvim.builtin.cmp.mappings = {
     -- ["<Tab>"] = function()
     ["<Tab>"] = cmp.mapping(function(fallback)
         if luasnip.expand_or_jumpable() then
             vim.fn.feedkeys(T("<Plug>luasnip-expand-or-jump"), "")
         else
             cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
             vim.fn.feedkeys(T("<Tab>"), "n")
             fallback()
         end
     end),

     ["<S-Tab>"] = cmp.mapping(function(fallback)
       if luasnip.jumpable(-1) then
         vim.fn.feedkeys(T "<Plug>luasnip-jump-prev", "")
       else
         cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
         fallback()
       end
     end, { "i", "s", }
    )
}



-- python
-- lvim.python.linter = 'flake8'
lvim.lang.python.isort = true

-- to change default formatter from yapf to black
-- lvim.lang.python.formatter.exe = "black"
-- lvim.lang.python.formatter.args = {"-"}

require('nvim-treesitter.parsers').get_parser_configs().norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

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
      -- vim.g['pandoc#compiler#arguments'] = "--highlight-style=/home/franveiga/.config/pandoc/themes/my.theme" -- Set the arguments for compiling a document
      vim.g['pandoc#compiler#arguments'] = "" -- Set the arguments for compiling a document
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
        vim.cmd("let g:vimwiki_ext2syntax={}")
        vim.g.vimwiki_folding = 'syntax'
        vim.o.foldlevel = 99
        vim.api.nvim_exec([[
          augroup My-Vimwiki
              autocmd FileType vimwiki set textwidth=80
          augroup END
        ]], false)
    end
  },


  -- One Dark
  {"navarasu/onedark.nvim"},
  -- {"Pocco81/Catppuccino.nvim",
  --   config = function()
  --       require("catppuccino").setup(
  --               {
  --                   integrations = {
  --                       telescope = true,
  --                       nvimtree = true,
  --                       barbar = true,
  --                       which_key = true,
  --                       dashboard = true,
  --                       gitsigns = true
  --                   }
  --               }
  --           )
  --   end
  --   },


  {"norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup({ "*" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              })
      end,
    },

    {"s1n7ax/nvim-terminal",
        config = function()
        local terminal = require 'nvim-terminal'
        terminal.setup({
            disable_default_keymaps = true
            })

        end,
    },

    {"nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                             }
                        },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                        neorg_leader = "<space>u"
                        }
                    }
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
    },


}


-- Additional Leader bindings for WhichKey
-- local additional_mappings = {
lvim.builtin.which_key.on_config_done = function()
    require "which-key".register({

        i = {
            name = "+Insert",

            u = {function()
                    local code = vim.fn.input("Code: ")
                    vim.api.nvim_command(string.format("r !printf '\\U00%s'", code))
                end
                , "Unicode"},
        },

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
            e = {"<cmd>!pandoc % --pdf-engine=xelatex " ..
                                 "-f vimwiki " ..
                                 "-V 'mainfont:NotoSans-Regular' " ..
                                 -- "-V 'mainfontoptions:{BoldFont NotoSans-Bold, ItalicFont NotoSans-Italic BoldItalicFont NotoSans-BoldItalic}' " ..
                                 "-t pdf " ..
                                 "-o %:p:r.pdf <cr>", "Export to Pdf"},

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

        d = {"<cmd>cd %:p:h<cr>", "Set CWD"},


        p = {
            s = {"<cmd>PackerStatus<cr>", "Status"},
            S = {"<cmd>PackerSync<cr>", "Sync"},
        },

        t = {
            name = "+Terminal",
            t = {"<cmd>lua NTGlobal['terminal']:toggle()<cr>", "Toggle"},
            ["1"] = {"<cmd>lua NTGlobal['terminal']:open(1)<cr>", "Terminal 1"},
            ["2"] = {"<cmd>lua NTGlobal['terminal']:open(2)<cr>", "Terminal 2"},
            ["3"] = {"<cmd>lua NTGlobal['terminal']:open(3)<cr>", "Terminal 3"},
            ["4"] = {"<cmd>lua NTGlobal['terminal']:open(4)<cr>", "Terminal 4"},
        },

    }, lvim.builtin.which_key.opts)
end




lvim.autocommands.custom_groups.text_filetype = {
    {"FileType", "text", "set tw=80"}
}
