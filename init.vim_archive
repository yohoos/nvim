filetype plugin indent on
syntax on

set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=UTF-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set smartindent
set cindent
set tabstop=4 shiftwidth=4 expandtab
" set gdefault            " Use 'g' flag by default with :s/foo/bar/.
" set magic               " Use 'magic' patterns (extended regular expressions).
set number
set relativenumber

" Stuff
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
" if &listchars ==# 'eol:$'
"    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"   set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
" endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
" Filesystem Viewer
Plug 'scrooloose/nerdtree'
" Comment/Uncomment tool
Plug 'numToStr/Comment.nvim'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Terminal Split Support
Plug 'vimlab/split-term.vim'
" New nvim fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Colorscheme
Plug 'sainnhe/everforest'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Start screen and session manager
Plug 'mhinz/vim-startify'
" Auto pairs for brackets and parenthesis
Plug 'windwp/nvim-autopairs'
" Markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" LSP configs
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig' " https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for configuring lsps
" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Generate Docs
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Golang LSP
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Git signs
Plug 'lewis6991/gitsigns.nvim'
" Intellisense engine (Use for Java, Scala)
" https://github.com/neoclide/coc.nvim/issues/3258#issuecomment-1236425856
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Keeping up to date with master
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

lua << EOF

  -- configure gitsigns
  require('gitsigns').setup()

  -- enable commenter plugin
  require('Comment').setup()

  -- enables nvim-autopairs
  require("nvim-autopairs").setup {}

  -- nvim-treesitter configs
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = {},
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      -- disable = function(lang, buf)
      --    local max_filesize = 100 * 1024 -- 100 KB
      --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --    if ok and stats and stats.size > max_filesize then
      --        return true
      --    end
      -- end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = true,
    },

    indent = {
        enable = true
    }
  }

  -- BELOW CONTAINS LSP AND AUTOCOMPLETE CONFIGURATIONS ----------------
  ----------------------------------------------------------------------

  -- Enable Metals scala lsp - requires installation of scala + coursier
  -- require'lspconfig'.metals.setup{}

  -- Enable docker lsp
  -- Needs `npm install -g dockerfile-language-server-nodejs`
  require'lspconfig'.dockerls.setup{}

  -- Enable json lsp
  -- Needs `npm i -g vscode-langservers-extracted`
  require'lspconfig'.jsonls.setup{}

  -- Enable python lsp
  require'lspconfig'.pyright.setup{}
  -- Needs to install multiple pip packages to use pylsp
  -- require'lspconfig'.pylsp.setup{
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         black = {
  --           enabled = true,
  --         },
  --         pylsp_mypy = {
  --           live_mode = true
  --         },
  --         isort = {
  --           enabled = true,
  --         },
  --         rope_autoimport = {
  --           enabled = true
  --         }
  --       }
  --     }
  --   }
  -- }

  -- Enable gopls LSP
  local lspconfig = require("lspconfig")
  lspconfig.gopls.setup({})

  require('go').setup()

  -- runs goimports
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      -- buf_request_sync defaults to a 1000ms timeout. Depending on your
      -- machine and codebase, you may want longer. Add an additional
      -- argument after params if you find that you have to write the file
      -- twice for changes to be saved.
      -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({async = false})
    end
  })

  -- Format on save using Black for python files
  vim.api.nvim_create_autocmd("bufWritePost", {
	group = vim.api.nvim_create_augroup("Black", { clear = true }),
	pattern = "*.py",
	command = "silent !black %",
  })

  -- Google: Modern Format On Save. Language agnostic. Leverages built in LSP
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format {async = false, id = args.data.client_id }
        end,
      })
    end
  })

  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require'luasnip'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      -- Use C-j/k to scroll through completion items.
	  ["<TAB>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
		  	cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
		  	luasnip.expand_or_jump()
		  else
		  	fallback()
		  end
	  end, {"i", "s"}),

	  ["<S-TAB>"] = cmp.mapping(function(fallback)
	  	if cmp.visible() then
	  		cmp.select_prev_item()
	  	elseif luasnip.jumpable(-1) then
	  		luasnip.jump(-1)
	  	else
	  		fallback()
	  	end
	  end, {"i", "s"}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig autocomplete.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  -- capabilities = capabilities
  -- }
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['jsonls'].setup {
      capabilities = capabilities
  }
  require('lspconfig')['dockerls'].setup {
      capabilities = capabilities
  }

EOF

" Startify session configs
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

" NERDTree Configs

let NERDTreeShowHidden=1

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Completion KeyMappings - interferes with other commands need to fix for Coc
" inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<ENTER>"
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<ENTER>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-k>"

" LSP shortcuts
nnoremap <C-R> <cmd>lua vim.lsp.buf.rename()<cr>

" KeyMappings for navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" KeyMappings for adding newlines
nnoremap <S-Enter> <Esc>o
nnoremap <C-Enter> <Esc>O
inoremap <S-Enter> <Esc>o
inoremap <C-Enter> <Esc>O

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-Space> <cmd>Telescope find_files<cr>

" Using Telescope shortcuts via lua functions 
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Airline Settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='catppuccin'
let g:airline_powerline_fonts=1

" Color Configs
hi Pmenu ctermbg=green ctermfg=black
hi PmenuSel ctermbg=cyan ctermfg=black
" colorscheme catppuccin
colorscheme everforest

