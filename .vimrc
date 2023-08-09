" 先在shell下运行下列命令，安装插件。"
" 1. 安装vim-plug.
"     curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. 安装powerline-font
"     sudo apt install fonts-powerline
" ---------------------------------------------------------------------- "
" 基础命令设置 "
set number
set relativenumber
set mouse=a
set hlsearch
set incsearch
set termencoding=utf-8
set encoding=utf-8
set cscopetag
set cc=120
set ts=8
let mapleader=","
" --- 高亮行尾空格 --- "
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" --- 记录退出编辑时的光标位置 --- "
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set backspace=indent,eol,start
set clipboard=exclude:.*

" --- FZF.VIM --- "
nnoremap <C-P> :Files <CR>
nnoremap <C-F> :Rg <CR>

" ---------------------------------------------------------------------- "
" * NerdTree * "
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
" --- F3打开目录 "
" map <F3> : NERDTreeMirror<CR>
map <F3> : NERDTreeToggle<CR>
" ---------------------------------------------------------------------- "
" * AirLine * "
" --- 保持状态栏开启 "
set laststatus=2
" --- 使用powerline字体 "
let g:airline_powerline_fonts = 1
" --- 开启 tab 栏 "
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'sonokai'
nnoremap <C-N> :bn <CR>
nnoremap <C-D> :bd <CR>

" --- 设置切换Buffer快捷键 "
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" ---------------------------------------------------------------------- "
" * nerdcommenter * "
filetype plugin on
filetype plugin indent on
syntax on
" --- Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" --- Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" --- Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" --- Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' }}
" --- Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" --- Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" --- Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ---------------------------------------------------------------------- "
" * vim-signify * "
" --- default updatetime 4000ms is not good for async update "
set updatetime=100
" --- 强制显示侧边栏 "
set signcolumn=yes
" ---------------------------------------------------------------------- "
" * TagList * "
let Tlist_Auto_Open=1
let Tlist_Inc_Winwidth=0
let Tlist_Use_Left_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
autocmd FileType taglist set norelativenumber
map <F4> :TlistToggle<cr>
" --- 重新指定tags的路径 "
set tags=~/.cache/tags/
" --- gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" --- 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" --- 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" --- 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" --- 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" ---------------------------------------------------------------------- "
let g:rehash256 = 1

if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'atlantis' " default, atlantis, andromeda, shusia, maia, espresso
let g:sonokai_better_performance = 1
colorscheme sonokai

" ---------------------------------------------------------------------- "
" * vim-plug * "
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-scripts/taglist.vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'dense-analysis/ale' "
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/sonokai'
call plug#end()