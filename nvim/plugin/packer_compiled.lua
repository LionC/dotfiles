-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

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
local package_path_str = "/Users/lionc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/lionc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/lionc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/lionc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lionc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["feline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfeline\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n�\1\0\0\6\0\b\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0004\5\0\0B\0\5\1K\0\1\0$<Plug>kommentary_visual_default\n<C-/>\6v\20nvim_set_keymap\bapi'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\nvsnip\2\rnvim_lua\2\vbuffer\2\tcalc\2\tpath\2\rnvim_lsp\2\14ultisnips\2\1\0\r\17autocomplete\2\fenabled\2\21incomplete_delay\3�\3\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\ndebug\1\20resolve_timeout\3�\6\19source_timeout\3�\1\18throttle_time\3P\14preselect\valways\15min_length\3\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jqx"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-jqx"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\5\0\0\3\0\19\0'6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\1\0005\1\f\0005\2\r\0=\2\14\0015\2\15\0=\2\16\0015\2\17\0=\2\18\1=\1\v\0K\0\1\0\blsp\1\0\4\tinfo\b\nerror\b\thint\b\fwarning\b\vfolder\1\0\b\17arrow_closed\b\topen\b\fdefault\b\fsymlink\b\nempty\b\15empty_open\b\15arrow_open\b\17symlink_open\b\bgit\1\0\a\14untracked\b★\runstaged\b✗\fdeleted\b\frenamed\b➜\fignored\b◌\runmerged\b\vstaged\b✓\1\0\2\fdefault\b\fsymlink\b\20nvim_tree_icons\1\0\4\ffolders\3\1\bgit\3\1\18folder_arrows\3\1\nfiles\3\1\25nvim_tree_show_icons\25nvim_tree_update_cwd\30nvim_tree_lsp_diagnostics\27nvim_tree_add_trailing\27nvim_tree_quit_on_open\24nvim_tree_gitignore\1\2\0\0\t.git\21nvim_tree_ignore\6g\bvim\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0005\4\15\0=\4\b\3=\3\16\2B\0\2\1K\0\1\0\17textsubjects\1\0\1\6.\23textsubjects-smart\1\0\1\venable\2\16textobjects\tswap\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\r\aib\17@scope.inner\aap\20@property.outer\aab\17@scope.outer\ais\18@string.inner\aac\19@comment.outer\aas\18@string.outer\aif\20@function.inner\aaf\20@function.outer\aan\f@number\aiv\20@variable.inner\aav\20@variable.outer\aic\19@comment.inner\aip\20@property.inner\1\0\1\venable\2\19ignore_install\1\2\0\0\fhaskell\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20overlay_opacity\3K\nsetup\nshade\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/lionc/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfeline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\5\0\0\3\0\19\0'6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\1\0005\1\f\0005\2\r\0=\2\14\0015\2\15\0=\2\16\0015\2\17\0=\2\18\1=\1\v\0K\0\1\0\blsp\1\0\4\tinfo\b\nerror\b\thint\b\fwarning\b\vfolder\1\0\b\17arrow_closed\b\topen\b\fdefault\b\fsymlink\b\nempty\b\15empty_open\b\15arrow_open\b\17symlink_open\b\bgit\1\0\a\14untracked\b★\runstaged\b✗\fdeleted\b\frenamed\b➜\fignored\b◌\runmerged\b\vstaged\b✓\1\0\2\fdefault\b\fsymlink\b\20nvim_tree_icons\1\0\4\ffolders\3\1\bgit\3\1\18folder_arrows\3\1\nfiles\3\1\25nvim_tree_show_icons\25nvim_tree_update_cwd\30nvim_tree_lsp_diagnostics\27nvim_tree_add_trailing\27nvim_tree_quit_on_open\24nvim_tree_gitignore\1\2\0\0\t.git\21nvim_tree_ignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\b\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0004\5\0\0B\0\5\1K\0\1\0$<Plug>kommentary_visual_default\n<C-/>\6v\20nvim_set_keymap\bapi'kommentary_create_default_mappings\6g\bvim\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0005\4\15\0=\4\b\3=\3\16\2B\0\2\1K\0\1\0\17textsubjects\1\0\1\6.\23textsubjects-smart\1\0\1\venable\2\16textobjects\tswap\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\r\aib\17@scope.inner\aap\20@property.outer\aab\17@scope.outer\ais\18@string.inner\aac\19@comment.outer\aas\18@string.outer\aif\20@function.inner\aaf\20@function.outer\aan\f@number\aiv\20@variable.inner\aav\20@variable.outer\aic\19@comment.inner\aip\20@property.inner\1\0\1\venable\2\19ignore_install\1\2\0\0\fhaskell\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\nvsnip\2\rnvim_lua\2\vbuffer\2\tcalc\2\tpath\2\rnvim_lsp\2\14ultisnips\2\1\0\r\17autocomplete\2\fenabled\2\21incomplete_delay\3�\3\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\ndebug\1\20resolve_timeout\3�\6\19source_timeout\3�\1\18throttle_time\3P\14preselect\valways\15min_length\3\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: shade.nvim
time([[Config for shade.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20overlay_opacity\3K\nsetup\nshade\frequire\0", "config", "shade.nvim")
time([[Config for shade.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
