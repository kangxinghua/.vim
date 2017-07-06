" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================
 
" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
 
" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"我的 Bundle:
Plugin 'https://github.com/kangxh/winmanager.git'
Plugin 'bufexplorer.zip'
Plugin 'The-NERD-tree'
Plugin 'minibufexpl.vim'              " buffer插件
Plugin 'molokai'                      " 配色
Plugin 'solarized'                    " 配色
Plugin 'obsidian'                     " 配色

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"禁止生成备份文件
set nobackup
" Reload .ideavimrc
nnoremap <leader>vs :source ~/.vimrc<CR>
"    backspace	specifies what <BS>, CTRL-W, etc. can do in Insert mode
set bs=2
"E303: Unable to open swap file
set directory=.,$TEMP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert  		" 配色方案
colorscheme molokai            " 配色方案
"colorscheme solarized          " 配色方案
"colorscheme obsidian          	" 配色方案
if !(g:isGUI)
	colorscheme desert  		" 配色方案
	set t_Co=256
endif

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"中文乱码
"set langmenu=zh_CN.utf8
"set fileencodings=utf-8,cp936,big5,latin1
"set ambiwidth=double
"set encoding=utf-8
"let $LANG='en'
set encoding=utf-8  
set fileencodings=utf-8,chinese,latin-1  
if g:iswindows  
 	set fileencoding=chinese  
else  
 	set fileencoding=utf-8  
endif  
"解决菜单乱码  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  
"解决consle输出乱码  
language messages zh_CN.utf-8 

"set number "显示行号
set showmode
set cul "高亮光标所在行
set cuc "高亮光标所在列

set laststatus=2    " 启动显示状态行(1),总是显示状态行(2) 
set showcmd  "输入的命令显示出来，linux下vim有用  


"搜索逐字符高亮
set hlsearch  "	'hls' 'hlsearch'	高亮显示所有的匹配短语
set incsearch "  'is' 'incsearch'	查找短语时显示部分匹配
set ignorecase smartcase " 如果你采用的模式里至少有一个大写字母，查找就成了大小写敏感的。

"状态行显示的内容  
" %(...%)     定义一个项目组。
" %{n}*     %对其余的行使用高亮显示组Usern，直到另一个%n*。数字n必须从1到9。用%*或%0*可以恢复正常的高亮显示。
" %&lt;     如果状态行过长，在何处换行。缺省是在开头。
" %=     左对齐和右对齐项目之间的分割点。
" %     字符%
" %B     光标下字符的十六进制形式
" %F     缓冲区的文件完整路径
" %H     如果为帮助缓冲区则显示为HLP
" %L     缓冲区中的行数
" %M     如果缓冲区修改过则显示为+
" %N     打印机页号
" %O     以十六进制方式显示文件中的字符偏移
" %P     文件中光标前的%
" %R     如果缓冲区只读则为RO
" %V     列数。如果与%c相同则为空字符串
" %W     如果窗口为预览窗口则为PRV
" %Y     缓冲区的文件类型，如vim
" %a     如果编辑多行文本，这个字行串就是({current} of {arguments})，例如：(5 of 18)。如果在命令行中只有一行，这个字符串为空
" %b     光标下的字符的十进制表示形式
" %c     列号
" %f     缓冲区的文件路径
" %h     如果为帮助缓冲区显示为[Help]
" %l     行号
" %m     如果缓冲区已修改则表示为[+]
" %n     缓冲区号
" %o     在光标前的字符数（包括光标下的字符）
" %p     文件中所在行的百分比
" %r     如果缓冲区为只读则表示为[RO]
" %t     文件名(无路径)
" %v     虚列号
" %w     如果为预览窗口则显示为[Preview]
" %y     缓冲区的文件类型，如[vim]
" %{expr}     表达式的结果

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" 设置字体，判断系统和参数
if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 12
elseif has("gui_macvim")
    set guifont=DejaVu_Sans_Mono:h12
elseif has("gui_win32")
    set guifont=Courier_New:h12:cANSI
end

" 打开文件后最大化
if g:iswindows  
	au GUIEnter * simalt ~x
else    
	au GUIEnter * call MaximizeWindow()
endif 

function! MaximizeWindow()    
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在你的vimrc文件中增加像如下这样格式的key bindings  
" 格式为：  
" 模式 <快捷键> 要执行的命令  
" 模式：看下表，nmap为普通模式,imap为编辑模式  
" C表示ctrl,A表示Alt,S表示Shift,<CR>表示回车,<Space>表示空格,<leader>表示|这个键这个
" 
" 比如下面这行表示在“正常||可视化||运算”模式下，按下Ctrl+W,则执行命令“:tabclose并回车”，就是关闭当前标签页  
" map <C-w> :tabclose<CR>  
"   
" 又比如这行表示在“正常模式”下，按下Ctrl+t,  
" 则依次执行:browse(打开选择文件对话框） tabnew将选定的文件在新标签页中打开  
" nmap <C-t> :browse tabnew<CR>  
"   
"   
" 下面这行和上面一样，只是先用Esc从编辑模式切换到正常模式  
" imap <C-t> <Esc>:browse tabnew<CR>  
"
""在一个映射后不能直接加注释，因为 " 字符也被当作是映射的一部分。你可以用 |" 绕
"过这一限制。这实际上是开始一个新的空命令。例如:  
"
"	:map <Space> W|     " Use spacebar to move forward a word

" Ctrl+c 复制
vnoremap <C-c> "+y 
" Ctrl+x     
vnoremap <C-x> "+d
" Ctrl+v 粘贴
noremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
cnoremap <C-v> <C-r>+
" Ctrl+s 保存
noremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>a
"判断是否是gui,终端这些命令不支持,除非 stty 去除掉终端的命令
if !(g:isGUI)
	" Ctrl+c 复制
	unmap <C-c>
	" Ctrl+x     
	unmap <C-x>
	" Ctrl+v 粘贴
	unmap <C-v>
	" Ctrl+s 保存
	unmap <C-s>
endif

" Ctrl+d 复制当前行
noremap <C-d> yyp
inoremap <C-d> <Esc>yypa
vnoremap <C-d> ykp
" 全选
noremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVGa
"ctrl+z撤销
noremap <C-z> u
inoremap <C-z> <Esc>u
" Shift 重做 [count] 次被撤销的更改。
noremap <S-z>  <Esc><C-r>
inoremap <S-z> <Esc><C-r>a
"替换字符串
noremap <C-r> <Esc>:%s/
vnoremap <C-r> "+y<Esc>:%s/<C-r>"
" Alt+= 把当前光标之上或之后的数值或者字母加上 [count]。
noremap <A-=> <C-a>
inoremap <A-=> <Esc><C-a>a
" Alt+- 把当前光标之上或之后的数值或者字母减去 [count]。
noremap <A--> <C-x>
inoremap <A--> <Esc><C-x>a
" clear the search buffer when hitting return
nnoremap <leader>/ <Esc>:nohlsearch<CR>
" 视图模式时,查询复制当前选中,方便查询
vnoremap <C-f> "+y<Esc>/<C-r>"
noremap <C-f> <Esc>/




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Winmanager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|BufExplorer'
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 50

nmap <leader>m :WMToggle<CR>

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
    return 1  
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Usage
"输入 :NERDTree 打开 NERDTree 窗口
"常用快捷键：
" o 打开/关闭光标所在目录
" t 在新 tab 中打开文件，并跳转到该 tab
" T 在新 tab 中打开文件，并不跳转到该 tab
" p 跳转到父节点
" P 跳转到根节点
" q 关闭 NERDTree 窗口
let g:NERDTree_title="[NERDTree]"
let NERDChristmasTree=1										" 类似圣诞树的显示方式
let NERDTreeAutoCenter=1									" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
"let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'	" 指定书签文件
let NERDTreeMouseMode=2										" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeShowBookmarks=1									" 是否默认显示书签列表
let NERDTreeShowFiles=1										" 是否默认显示文件
let NERDTreeShowHidden=0									" 是否默认显示隐藏文件
let NERDTreeShowLineNumbers=0								" 是否默认显示行号
let NERDTreeWinPos='left'									" 窗口位置（'left' or 'right'）
let NERDTreeWinSize=24										" 窗口宽度
"let NERDTreeQuitOnOpen=1									" 当通过NERD Tree打开文件自动退出NERDTree界面
"nnoremap <Leader>nt :NERDTree<CR>		" <Leader> + nt	->打开NERDTree界面
"nmap <silent> <F3> :NERDTree<CR>		" <Leader> + nt	->打开NERDTree界面

""""""""""""""""""""""""""""""""""""""""""""""""""
" minibuffexploer
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   "<C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavArrows = 1  "<C-箭头>箭头切换
"let g:miniBufExplMapCTabSwitchBufs = 1   "<C-Tab>切换窗口(有冲突)
"let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
"常用操作
" :e <filename> 打开文件
" :ls    当前打开的buf
" :bn    下一个buf
" :bp    前一个buf
" :b<n>    n是数字，第n个buf
" :b<tab>    自动补齐
" :bd    删除
""""""""""""""""""""""""""""""""""""""""""""""""""
