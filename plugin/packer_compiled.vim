" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/arxcruz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/arxcruz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/arxcruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/arxcruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/arxcruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["nova-vim"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/nova-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/arxcruz/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
