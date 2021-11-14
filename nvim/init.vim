" Editor Behavior
" ===============

" Avoid messy code
set encoding=utf-8
set fileencodings=utf-8,gbk,big5
set nocompatible

" General visual settings
" set cursorline
set number
" set relativenumber
" if has("patch-8.1.1564")
" 	set signcolumn=number
" else
" 	set signcolumn=yes
" endif
" set colorcolumn=100
set noshowmode
set nowrap
autocmd FileType markdown set wrap
set scrolloff=4


" Split
set splitright
set splitbelow


" Search
set ignorecase " Make search case insensitive
set smartcase
set hlsearch
set incsearch


" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set hidden


" Input
set backspace=2 " Avoid <BS> stop working
set notimeout
set ttimeoutlen=100


" Code folding
set foldmethod=indent
set foldlevel=99
set foldenable


" Indentation
" Real program dont use TABs but spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set shiftround


" Accelerator
set lazyredraw "should make scrolling faster

" Mouse
" set mouse+=a




" Terminal Behavior
tnoremap <Esc> <C-\><C-n>
augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
augroup END



" Basic Mappings
let mapleader = ','
noremap ; :

" Quick save
noremap <leader>w :w<CR>
vnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>

" Quick quit 
noremap <leader>wq <Esc>:wq<CR>
noremap <leader>q <Esc>:q!<CR>
inoremap jj <Esc>

" Search
noremap <leader>s /
inoremap <leader>s <Esc>/

" Redo
noremap <C-u> <C-r>


" Open the vimrc file anytime
noremap <leader>rc :e ~/.config/nvim/init.vim


" Indentation
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv


" N key: go to the start of the line
noremap <silent> H 0
noremap <silent> L $




" Window management
" Use Ctrl + hjkl to switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" Tab management
noremap tn :tabnew<CR>
noremap th :tabprevious<CR>
noremap tl :tabnext<CR>


" Buffer management
noremap bd :bdelete<CR>
noremap bp :bprevious<CR>
noremap bn :bnext<CR>



" Vim Plug
call plug#begin('~/.config/nvim/plugged')


" Colorscheme
" Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'


" Status Line
" Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}


" General Highlighter
Plug 'RRethy/vim-illuminate'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }


" Other Visual Enhancement
" Plug 'ryanoasis/vim-devicons' " vimscript
" Plug 'kyazdani42/nvim-web-devicons' " lua
" Plug 'mhinz/vim-signify'
Plug 'https://github.com/airblade/vim-gitgutter.git'


" File Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Slime for vim
Plug 'jpalardy/vim-slime'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Native LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'

" Debugger
" Plug 'puremorning/vimspector'
" Plug 'szw/maximizer'

" Enhancement
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
Plug 'tpope/vim-commentary'
" Plug 'godlygeek/tabular'
" Plug 'easymotion/vim-easymotion'

" Find & Replace
" Plug 'brooth/far.vim'

call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" Colorscheme
" ===========
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
syntax on

" OneDark
" let g:nvcode_termcolors = 256
" colorscheme onedark

" Solarized8
set background=dark
colorscheme solarized8_flat
let g:solarized_visibility="normal"
let g:solarized_diffmode="normal"
let g:solarized_termtrans=0
let g:solarized_extra_hi_groups=1
let g:solarized_statusline="low"
let g:solarized_italics=1
let g:solarized_old_cursor_style=1
autocmd vimenter * ++nested colorscheme solarized8


" itchyny/lightline.vim
" let g:lightline = {
"     \ 'colorscheme': 'onedark',
"     \ }

" let g:lightline.tabline = {
"     \ 'left': [ [ 'tabs' ] ],
"     \ 'right': [  ],
"     \ }

" let g:lightline.tab = {
"     \ 'active': [ 'filename', 'modified' ],
"     \ 'inactive': [ 'filename', 'modified' ],
"     \ }

" let g:lightline.seperator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }

" let g:lightline.enable = {
"     \ 'statusline': 1,
"     \ 'tabline': 1
"     \ }


" vim-illuminate
let g:Illuminate_ftblacklist = [ 'nerdtree' ]
let g:Illuminate_delay = 0
" hi link illuminatedWord Visual


" RRethy/vim-hexokinase
" set termguicolors
" let g:Hexokinase_highlighters = [ 'backgroundfull' ]


" nvim-treesitter/nvim-treesitter
"lua << EOF
"require('nvim-treesitter.configs').setup {
"  ensure_installed = {  "bash", "c", "c_sharp", "cpp", "fortran", "python",
"                        "json", "html", "latex", "lua"},
"  highlight = {
"    enable = true,
"    disable = { "python", "c" }
"  },
"}
"EOF


" airblace/vim-gitgutter
let g:gitgutter_map_keys = 0
" nmap c[ <Plug>(GitGutterPrevHunk)
" nmap c] <Plug>(GitGutterNextHunk)


" LunarWatcher/auto-pairs
let g:AutoPairsCompatibleMaps = 0 " recommended setting



" kien/rainbow_parentheses.vim
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" let g:rbpt_loadcmd_toggle = 0
" let g:rbpt_max = 16
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]




" easymotion/vim-easymotion
" nmap ss <Plug>(easymotion-s2)
" let g:EasyMotion_smartcase = 1


" nvim-telescope/telescope.nvim
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        entry_prefix = "  ",
        prompt_prefix = "► ",
        selection_caret = "► ",
        initial_mode = "insert",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        winblend = 10,
        set_env = { ['COLORTERM'] = 'truecolor' },
        color_devicons = true,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        path_display = {},
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

        file_sorter =  require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    }
}
EOF

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fc <cmd>Telescope colorscheme<cr>


" jpalardy/vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {
    \ "socket_name": "default",
    \ "target_pane": "{right-of}",
    \ }
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1



" neoclide/coc.nvim
let g:coc_global_extensions = [
	\ 'coc-pyright',
	\ 'coc-json',
	\ 'coc-vimlsp',
    \ 'coc-snippets']

" Use <TAB> for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <leader>c to trigger completion
inoremap <silent><expr> <leader>c coc#refresh()

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <space>k to show documentation in preview window.
nnoremap <silent> <space>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
