call plug#begin('~/.vim/plugged')
	Plug	'scrooloose/nerdtree'
	Plug    'scrooloose/syntastic'
	Plug	'majutsushi/tagbar'
	Plug	'vim-scripts/taglist.vim'
	Plug    'vim-scripts/indentpython.vim'
	Plug	'vim-airline/vim-airline'
	Plug	'SirVer/ultisnips'
	Plug	'godlygeek/tabular'
	Plug	'junegunn/fzf.vim'
    Plug    'Lokaltog/vim-powerline'
	Plug    'Yggdroot/indentLine'
	Plug    'jiangmiao/auto-pairs'
	Plug    'scrooloose/nerdcommenter'
    Plug    'tell-k/vim-autopep8'
	Plug    'nvie/vim-flake8'  "F7
	Plug    'honza/vim-snippets'
    Plug    'w0rp/ale'
	Plug    'Shougo/deoplete-clangx'
  	Plug    'Shougo/deoplete.nvim'
  	Plug    'roxma/nvim-yarp'
  	Plug    'roxma/vim-hug-neovim-rpc'	
	Plug    'maralla/completor.vim'
    Plug    'kien/ctrlp.vim' "搜索插件
    Plug    'tpope/vim-fugitive'  "git集成
"python autocomplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'

    "Plug    'davidhalter/jedi-vim'
    "安装代码补全框架
    " Plug 'ncm2/ncm2'
    "Plug 'roxma/nvim-yarp'
	"Plug 'ncm2/ncm2-jedi'

	
   "Plug    'neoclide/coc.nvim', {'branch': 'release'}
   "Plug    'zchee/deoplete-jedi'
   
call plug#end()

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"deoplete
let g:deoplete#enable_at_startup = 1

"jedi-vim
"let g:jedi#completions_command = "<C-X>"

"基础设置
"--------------------------------------------------------------
let fancy_symbols_enabled = 0
let g:deoplete#enable_at_startup = 1
set pyxversion=3
"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"去掉vi的一致性"
set nocompatible

" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0

"显示行号
set nu
set number

syntax on   "开启语法高亮"

set cursorline
set cul          "cursorline的缩写形式'

set cursorcolumn
set cuc          "cursorcolumn的缩写形式'

set mouse=v

set showmatch

"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释'
set autoindent

set hlsearch        "高亮搜索项"


set listchars=tab:>-,trail:-

"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler

filetype plugin indent on

"去掉gvim菜单栏
"set go-=m
"去掉gvim工具栏
set go-=T

set shortmess=atI

" Enable folding
set foldmethod=indent
set foldlevel=99
" 通过空格键快速打开和关闭折叠
nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
"--------------------------------------------------------------

"快速运行
"-----------------------------------------------------
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

"--------------------------------------------------------

"NERDTree 配置
"--------------------------------------------------------
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
"----------------------------------------------------------

"autopep8 配置 -- F8
"----------------------------------------------------------
"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

au BufNewFile,BufRead *.py
\ set tabstop=4   "tab宽度
\ set softtabstop=4 
\ set shiftwidth=4  
\ set textwidth=79  "行最大宽度
\ set expandtab       "tab替换为空格键
\ set autoindent      "自动缩进
\ set fileformat=unix   "保存文件格式
"-----------------------------------------------------------

"ncm2
"-----------------------------------------------------------
"缓存
"autocmd BufEnter * call ncm2#enable_for_buffer()
" 补全模式
"set completeopt=menu,noinsert
"set shortmess+=c
"inoremap <c-c> <ESC>
" 延迟弹窗
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1, 1]]
"模糊匹配模式,详情 :help ncm2
"let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"   
"-----------------------------------------------------------
