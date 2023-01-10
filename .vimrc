" 先在shell下运行下列命令，安装插件。"
" 1. 安装vim-plug.
"     curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. 安装powerline-font
"     sudo apt install fonts-powerline
" ---------------------------------------------------------------------- "
"  基础命令设置 "
set number
set mouse=a
set hlsearch
set incsearch
set termencoding=utf-8
set encoding=utf-8
set cscopetag
set cc=120
set ts=4
" ---------------------------------------------------------------------- "
" F3打开目录 "
map <F3> : NERDTreeMirror<CR>
map <F3> : NERDTreeToggle<CR>
" ---------------------------------------------------------------------- "
" 高亮行尾空格 "
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" ---------------------------------------------------------------------- "
" 记录退出编辑时的光标位置 "
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" ---------------------------------------------------------------------- "
set laststatus=2
let g:airline_powerline_fonts = 1
" 开启 tab 栏
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" ---------------------------------------------------------------------- "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' }}
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ---------------------------------------------------------------------- "
" vim-signify: default updatetime 4000ms is not good for async update "
set updatetime=100
" 强制显示侧边栏 "
set signcolumn=yes
" ---------------------------------------------------------------------- "
" TagList配置 "
let Tlist_Inc_Winwidth=0
let Tlist_Use_Left_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
map <F4> :TlistToggle<cr>

" 重新指定tags的路径 "
set tags=~/.cache/tags/

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" ---------------------------------------------------------------------- "

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
call plug#end()
