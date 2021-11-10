-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/franveiga/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/franveiga/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/franveiga/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/franveiga/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/franveiga/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    config = { "\27LJ\1\2•\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\6\vbarbar\2\rnvimtree\2\14telescope\2\rgitsigns\2\14which_key\2\14dashboard\2\nsetup\16catppuccino\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/Catppuccino.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip"
  },
  colorschemes = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/colorschemes"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14on_attach\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17core.lualine\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/lualine.nvim"
  },
  neorg = {
    config = { "\27LJ\1\2Š\2\0\0\5\0\15\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\r\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\v\0003\4\n\0:\4\b\3:\3\f\2:\2\14\1>\0\2\1G\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\17neorg_leader\r<space>u\21default_keybinds\2\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/neorg"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.autopairs\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\a\bcss\2\vrgb_fn\2\rRRGGBBAA\2\vhsl_fn\2\vcss_fn\2\bRGB\2\vRRGGBB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\1G\0\1\0\nsetup\20core.lspinstall\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-terminal"] = {
    config = { "\27LJ\1\2[\0\0\3\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\1G\0\1\0\1\0\1\28disable_default_keymaps\2\nsetup\18nvim-terminal\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-terminal"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17core.project\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-pandoc"] = {
    config = { "\27LJ\1\2Å\4\0\0\3\0\r\0\0314\0\0\0007\0\1\0'\1\5\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0004\0\0\0007\0\n\0007\0\v\0%\1\f\0)\2\1\0>\0\3\1G\0\1\0Ì\1        augroup My-Pandoc\n            autocmd FileType pandoc set textwidth=80\n            autocmd FileType pandoc set nospell\n            autocmd FileType pandoc set fo+=t\n        augroup END\n      \14nvim_exec\bapiE--highlight-style=/home/franveiga/.config/pandoc/themes/my.theme\30pandoc#compiler#arguments\fxelatex pandoc#command#latex_engine\30pandoc#syntax#conceal#use\"pandoc#folding#foldlevel_yaml\29pandoc#folding#fold_yaml\25pandoc#folding#level\6g\bvim\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/vim-surround"
  },
  vimwiki = {
    config = { "\27LJ\1\2ž\2\0\0\3\0\v\0\0194\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\3\0%\1\5\0:\1\4\0004\0\0\0007\0\6\0'\1c\0:\1\a\0004\0\0\0007\0\b\0007\0\t\0%\1\n\0)\2\1\0>\0\3\1G\0\1\0x          augroup My-Vimwiki\n              autocmd FileType vimwiki set textwidth=80\n          augroup END\n        \14nvim_exec\bapi\14foldlevel\6o\vsyntax\20vimwiki_folding\6g let g:vimwiki_ext2syntax={}\bcmd\bvim\0" },
    loaded = true,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/franveiga/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rcore.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\1\2ž\2\0\0\3\0\v\0\0194\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\3\0%\1\5\0:\1\4\0004\0\0\0007\0\6\0'\1c\0:\1\a\0004\0\0\0007\0\b\0007\0\t\0%\1\n\0)\2\1\0>\0\3\1G\0\1\0x          augroup My-Vimwiki\n              autocmd FileType vimwiki set textwidth=80\n          augroup END\n        \14nvim_exec\bapi\14foldlevel\6o\vsyntax\20vimwiki_folding\6g let g:vimwiki_ext2syntax={}\bcmd\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\1\2Š\2\0\0\5\0\15\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\r\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\v\0003\4\n\0:\4\b\3:\3\f\2:\2\14\1>\0\2\1G\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\17neorg_leader\r<space>u\21default_keybinds\2\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-pandoc
time([[Config for vim-pandoc]], true)
try_loadstring("\27LJ\1\2Å\4\0\0\3\0\r\0\0314\0\0\0007\0\1\0'\1\5\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0004\0\0\0007\0\n\0007\0\v\0%\1\f\0)\2\1\0>\0\3\1G\0\1\0Ì\1        augroup My-Pandoc\n            autocmd FileType pandoc set textwidth=80\n            autocmd FileType pandoc set nospell\n            autocmd FileType pandoc set fo+=t\n        augroup END\n      \14nvim_exec\bapiE--highlight-style=/home/franveiga/.config/pandoc/themes/my.theme\30pandoc#compiler#arguments\fxelatex pandoc#command#latex_engine\30pandoc#syntax#conceal#use\"pandoc#folding#foldlevel_yaml\29pandoc#folding#fold_yaml\25pandoc#folding#level\6g\bvim\0", "config", "vim-pandoc")
time([[Config for vim-pandoc]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\a\bcss\2\vrgb_fn\2\rRRGGBBAA\2\vhsl_fn\2\vcss_fn\2\bRGB\2\vRRGGBB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: Catppuccino.nvim
time([[Config for Catppuccino.nvim]], true)
try_loadstring("\27LJ\1\2•\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\6\vbarbar\2\rnvimtree\2\14telescope\2\rgitsigns\2\14which_key\2\14dashboard\2\nsetup\16catppuccino\frequire\0", "config", "Catppuccino.nvim")
time([[Config for Catppuccino.nvim]], false)
-- Config for: nvim-terminal
time([[Config for nvim-terminal]], true)
try_loadstring("\27LJ\1\2[\0\0\3\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\1G\0\1\0\1\0\1\28disable_default_keymaps\2\nsetup\18nvim-terminal\frequire\0", "config", "nvim-terminal")
time([[Config for nvim-terminal]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'dashboard-nvim', 'which-key.nvim', 'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lsp_signature.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-comment'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
