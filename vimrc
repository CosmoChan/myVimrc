"==========================================
" General Settings 基础设置
"==========================================
syntax on               "语法高亮
set nrformats=          "00x增减数字时使用十进制
set nu                  "行号
set cursorline          "突出显示当前行
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

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

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
filetype plugin indent on

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" highlight color
hi Search term=bold ctermbg=81 guibg=LightBlue

"==========================================
" NERDTree Settings 目录树设置
"==========================================
autocmd BufEnter * lcd %:p:h
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
" let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 用H和L来跳到行首行尾
noremap H ^
noremap L $

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

" 用于插件安装的pathogen
execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()

" 允许插件
filetype plugin indent on

" 行间移动按物理行来, 而不是实际行
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

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

" 打开Vim停在上一次的光标位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif"'")"'")"'")


"==========================================
" TagList 设置
"==========================================
filetype on
filetype indent on

" F9编译和运行C程序，C++程序,Python程序，shell程序，F9 gdb调试
" 请注意，下述代码在windows下使用会报错，需要去掉./这两个字符
"
" <f9> 编译和运行C
" map <f9> :call CompileRunGcc()<cr>
" func! CompileRunGcc()
" exec "w"
" exec "!gcc % -o %<"
" exec "! ./%<"
" endfunc
 
"< F9> 编译和运行C++
map <f9> :call CompileRunGpp()<cr>
func! CompileRunGpp()
exec "w"
exec "!g++ -std=c++0x % -o %<"
exec "! ./%<"
endfunc
  
" <f9> 运行python程序
" map <f9> :w<cr>:!python %<cr>
 
" " <f9> 运行shell程序
" map <f9> :call CompileRunSH()<cr>
" func! CompileRunSH()
" exec "w"
" exec "!chmod a+x %"
" exec "!./%"
" endfunc
 
" "<f9>  gdb调试
" map <f9> :call Debug()<cr>
" func!  Debug()
" exec "w"
" exec "!gcc % -o %< -gstabs+"
" exec "!gdb %<"
" endfunc
"
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

" 解决插入模式下delete/backspace键失效
set backspace=2

" 使用语法高亮定义代码折叠
set foldmethod=syntax
" 打开文件默认不折叠代码
set foldlevelstart=99
