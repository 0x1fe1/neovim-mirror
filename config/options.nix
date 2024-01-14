{
  config.options = {
    number = true;
    relativenumber = true;
    cursorline = true;
    lazyredraw = true;
    showmatch = false; # Highlight matching parentheses, etc
    incsearch = true;
    hlsearch = false;

    expandtab = true;
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;

    signcolumn = "yes";
    encoding = "utf-8";
    fileencoding = "utf-8";
    mouse = "a";
    scrolloff = 4;

    foldcolumn = "0"; # '0' is not bad
    foldlevel = 99; # Using ufo provider need a large value, feel free to decrease the value
    foldlevelstart = 99;
    foldenable = true;
    fillchars = "eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:▶";

    splitright = true;
    splitbelow = true;
    backup = false;
    swapfile = false;
    writebackup = false;

    undofile = true;
    undodir = "/home/pango/.vim/undodir";
    undolevels = 1000;
    undoreload = 10000;
  };
}
