"==========================================
" General Settings 基础设置
"==========================================
set nocp                "不兼容vi
syntax on               "语法高亮
set nrformats=          "00x增减数字时使用十进制
set nu                  "行号
" set cursorline          "突出显示当前行
set nobackup            "覆盖文件时不备份
set noswapfile          "取消交换文件
set ruler               "右下角显示光标位置
set autoindent          "自动缩进
set mouse-=a            "关闭鼠标
set title               "改变terminal标题
set scrolloff=7         "移动时光标上下方至少保留7行
set autoread            " 文件修改后自动载入
set shortmess=atI       " 启动的时候不显示帮助乌干达那些提示
set showmode            "左下角显示当前vim模式
set nowrap              "不换行
set hlsearch            "高亮符合搜索的文本
set pastetoggle=<F12>   "F12切换粘贴模式 
set showmatch           "跳转并高亮一下匹配的括号
set ignorecase          "搜索忽略大小写
" <C-c> 复制所有内容
nnoremap <C-c> gg V G y
" 'd'键跳转函数定义
nnoremap D # :noh <CR>
" indent可以删除缩进, eol可以合并两行, start可以删除此次插入前的输入
set backspace=indent,eol,start
" 在行头能跳转上一行, 行尾能跳转下一行
set ww=b,s,[,],h,l
" 保持所搜索的内容在屏幕中间
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" 用四个空格显示制表符
set tabstop=4
" 当使用'>'时缩进4个空格
set shiftwidth=4
" Tab输入4个空格
set expandtab
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" highlight color
hi Search cterm=NONE ctermfg=red ctermbg=lightblue
" 用H和L来跳到行首行尾
noremap H ^
noremap L $
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" 行间移动按物理行来, 而不是实际行
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %
" 解决Shift键没及时弹回造成的意外大写
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
" 允许在vim外部粘贴进来时用p
if has('clipboard')
    if has('unnamedplus')  
        set clipboard=unnamed,unnamedplus
    else         
        set clipboard=unnamed
    endif
endif
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

"==========================================
" FileEncode Settings 文件编码, 格式
"==========================================
set encoding=utf-8      "新文件编码为utf-8
" 自动判断编码时, 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


"==========================================
" StatusLine Settings 状态栏设置
"==========================================
set statusline=%F%m%r%h%w\ %=#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%
set rulerformat=%43(%=%m%r%h%w#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%%)


"==========================================
" Window Size Vim窗口设置
"==========================================
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=70 columns=220
else
  " This is console Vim.
  if exists("+lines")
    set lines=70
  endif
  if exists("+columns")
    set columns=220
  endif
endif

"==========================================
" Pathogen 设置
"==========================================
execute pathogen#infect()
filetype plugin indent on

"==========================================
" NERDCOMMENTER 设置
"==========================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"==========================================
" VIM-LATEX 设置
"==========================================
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:tex_indent_items=0


"==========================================
" NERD TREE 设置
"==========================================
" 当只剩下NERDTree窗口的时候关闭VIM
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set autochdir " 工作目录改为当前目录
autocmd BufEnter * lcd %:p:h
" NERD TREE 开关
nnoremap <C-n> :NERDTreeToggle <CR>
" 自动打开NERDTree
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
