final: prev:
with final.pkgs.lib; let
  pkgs = final.pkgs;

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {};

  all-plugins = with pkgs.vimPlugins;
    [
      # plugins from nixpkgs go in here.
      # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
      nvim-treesitter.withAllGrammars
      luasnip # snippets | https://github.com/l3mon4d3/luasnip/

      # Autocompletion And Extensions
      nvim-cmp # https://github.com/hrsh7th/nvim-cmp
      cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
      lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
      cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
      cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
      cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
      cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
      cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/

      # Git Integration Plugins | have not *yet* seen a need for them
      # neogit # https://github.com/TimUntersberger/neogit/
      # gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
      # vim-fugitive # https://github.com/tpope/vim-fugitive/

      # Telescope And Extensions
      telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
      telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim

      # UI
      lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
      nvim-treesitter-context # https://github.com/nvim-treesitter/nvim-treesitter-context
      which-key-nvim

      # Language Support
      neodev-nvim # adds support for Neovim's Lua API to lua-language-server | https://github.com/folke/neodev.nvim/

      # Navigation/Editing Enhancement Plugins
      nvim-surround # https://github.com/kylechui/nvim-surround/
      nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
      nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
      comment-nvim # comment utils | https://github.com/numtostr/comment.nvim/
      playground # treesitter playground | https://github.com/nvim-treesitter/playground/

      # Dependencies
      # sqlite-lua
      plenary-nvim
      nvim-web-devicons
      vim-repeat

      # Themes
      catppuccin-nvim # the one and only theme.
    ]
    ++ (with pkgs.nvimPlugins; [
      # Bleeding-edge plugins from flake inputs go in here
      transparent # makes the neovim background transparent
      move # allows Alt+j/k to move lines | https://github.com/fedepujol/move.nvim
      harpoon # Quick jumping between files | https://github.com/ThePrimeagen/harpoon/
    ]);

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP

    alejandra # nix formatter

    zls # zig LSP
    gopls # go LSP

    # marksman

    # prettierd
    # nodePackages_latest.prettier

    # vscode-langservers-extracted
    # nodePackages_latest.vscode-css-languageserver-bin
    # nodePackages_latest.typescript-language-server

    # nodePackages_latest.svelte-language-server
    # nodePackages_latest.svelte-check
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # You can add as many derivations as you like.
}
