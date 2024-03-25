{ config, pkgs, lib, ... }:

{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = false;

    withPython3 = true;
    withRuby = true;

    extraLuaConfig = ''

      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '

      -- [[ Setting options ]]
      -- See `:help vim.o`
      -- NOTE: You can change these options as you wish!

      vim.o.tabstop = 2

      -- Set highlight on search
      vim.o.hlsearch = true

      -- Make line numbers default
      vim.wo.number = true
      vim.wo.relativenumber = true

      -- Enable mouse mode
      vim.o.mouse = 'a'

      -- Sync clipboard between OS and Neovim.
      --  Remove this option if you want your OS clipboard to remain independent.
      --  See `:help 'clipboard'`
      vim.o.clipboard = 'unnamedplus'

      -- Enable break indent
      vim.o.breakindent = true

      -- Save undo history
      vim.o.undofile = true

      -- Case-insensitive searching UNLESS \C or capital in search
      vim.o.ignorecase = true
      vim.o.smartcase = true

      -- Keep signcolumn on by default
      vim.wo.signcolumn = 'yes'

      -- Decrease update time
      vim.o.updatetime = 250
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menuone,noselect'

      -- NOTE: You should make sure your terminal supports this
      vim.o.termguicolors = true

      vim.g.copilot_no_tab_map = true

      vim.keymap.set('n', '<C-j>', "<C-w><C-j>", {})
      vim.keymap.set('n', '<C-k>', "<C-w><C-k>", {})
      vim.keymap.set('n', '<C-l>', "<C-w><C-l>", {})
      vim.keymap.set('n', '<C-h>', "<C-w><C-h>", {})
    '';

    plugins = with pkgs.vimPlugins; [
      vim-fugitive
      vim-rhubarb
      nvim-notify
      vim-dadbod
      vim-dadbod-ui
      vim-dadbod-completion
      nvim-web-devicons
      plenary-nvim
      vim-sleuth
      {
        plugin = pkgs.vimPlugins.vim-commentary;
        config = toLuaFile ./config/commentary.lua;
      }

      nvim-lightbulb
      {
        plugin = pkgs.vimPlugins.copilot-vim;
        config = toLuaFile ./config/copilot.lua;
      }
      colorizer
      ansible-vim
      {
        plugin = pkgs.vimPlugins.harpoon;
        config = toLuaFile ./config/harpoon.lua;
      }
      {
        plugin = pkgs.vimPlugins.catppuccin-nvim;
        config = ''
          colorscheme catppuccin
          hi Normal guibg=#CC1F2430
          hi NormalFloat guibg=#1F2430
          hi NormalNC guibg=#CC1F2430
          hi NvimTreeNormal guibg=#CC1F2430
          hi WinSeparator guibg=#313843
          hi NvimTreeWinSeparator guifg=#313843
          hi NvimTreeWinSeparator guibg=#313843
        '';
      }
      {
        plugin = pkgs.vimPlugins.aurora;
        config = ''
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-tree-lua;
        config = toLuaFile ./config/nvim-tree.lua;
      }
      cmp_luasnip
      luasnip
      cmp-nvim-lsp
      friendly-snippets
      neodev-nvim
      {
        plugin = pkgs.vimPlugins.nvim-cmp;
        config = toLuaFile ./config/cmp.lua;
      }
      {
        plugin = pkgs.vimPlugins.nvim-lspconfig;
        config = toLuaFile ./config/nvim-lsp.lua;
      }
      comment-nvim
      
      (nvim-treesitter.withPlugins (p: [  
          p.tree-sitter-nix 
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
      ]))
       
      {
        plugin = pkgs.vimPlugins.telescope-fzf-native-nvim;
        config = toLuaFile ./config/telescope.lua;
      }
      
    ];
    
    extraPackages = with pkgs; [
      # Language server packages (executables)
      luajitPackages.lua-lsp
      haskell-language-server
      sumneko-lua-language-server
      elmPackages.elm-language-server
      nodejs
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.pyright
      python311Packages.django
      python311Packages.psycopg2
      python311Packages.psycopg
      vscode-extensions.batisteo.vscode-django
      terraform-lsp
      postgres-lsp
      nodePackages.vscode-html-languageserver-bin
      nodePackages_latest.vscode-json-languageserver-bin
      nodePackages_latest.vscode-css-languageserver-bin
    ];
  };
}
