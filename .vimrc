" =============================================================================
"        << �жϲ���ϵͳ�� Windows ���� Linux ���ж����ն˻��� Gvim >>
" =============================================================================
 
" -----------------------------------------------------------------------------
"  < �жϲ���ϵͳ�Ƿ��� Windows ���� Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
 
" -----------------------------------------------------------------------------
"  < �ж����ն˻��� Gvim >
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

"�ҵ� Bundle:
Plugin 'https://github.com/kangxh/winmanager.git'
Plugin 'bufexplorer.zip'
Plugin 'The-NERD-tree'
Plugin 'minibufexpl.vim'              " buffer���
Plugin 'molokai'                      " ��ɫ
Plugin 'solarized'                    " ��ɫ
Plugin 'obsidian'                     " ��ɫ

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��ֹ���ɱ����ļ�
set nobackup
" Reload .ideavimrc
nnoremap <leader>vs :source ~/.vimrc<CR>
"    backspace	specifies what <BS>, CTRL-W, etc. can do in Insert mode
set bs=2
"E303: Unable to open swap file
set directory=.,$TEMP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ʾ���  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert  		" ��ɫ����
colorscheme molokai            " ��ɫ����
"colorscheme solarized          " ��ɫ����
"colorscheme obsidian          	" ��ɫ����
if !(g:isGUI)
	colorscheme desert  		" ��ɫ����
	set t_Co=256
endif

" �����﷨��������
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on

"��������
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
"����˵�����  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  
"���consle�������  
language messages zh_CN.utf-8 

"set number "��ʾ�к�
set showmode
set cul "�������������
set cuc "�������������

set laststatus=2    " ������ʾ״̬��(1),������ʾ״̬��(2) 
set showcmd  "�����������ʾ������linux��vim����  


"�������ַ�����
set hlsearch  "	'hls' 'hlsearch'	������ʾ���е�ƥ�����
set incsearch "  'is' 'incsearch'	���Ҷ���ʱ��ʾ����ƥ��
set ignorecase smartcase " �������õ�ģʽ��������һ����д��ĸ�����Ҿͳ��˴�Сд���еġ�

"״̬����ʾ������  
" %(...%)     ����һ����Ŀ�顣
" %{n}*     %���������ʹ�ø�����ʾ��Usern��ֱ����һ��%n*������n�����1��9����%*��%0*���Իָ������ĸ�����ʾ��
" %&lt;     ���״̬�й������ںδ����С�ȱʡ���ڿ�ͷ��
" %=     �������Ҷ�����Ŀ֮��ķָ�㡣
" %     �ַ�%
" %B     ������ַ���ʮ��������ʽ
" %F     ���������ļ�����·��
" %H     ���Ϊ��������������ʾΪHLP
" %L     �������е�����
" %M     ����������޸Ĺ�����ʾΪ+
" %N     ��ӡ��ҳ��
" %O     ��ʮ�����Ʒ�ʽ��ʾ�ļ��е��ַ�ƫ��
" %P     �ļ��й��ǰ��%
" %R     ���������ֻ����ΪRO
" %V     �����������%c��ͬ��Ϊ���ַ���
" %W     �������ΪԤ��������ΪPRV
" %Y     ���������ļ����ͣ���vim
" %a     ����༭�����ı���������д�����({current} of {arguments})�����磺(5 of 18)���������������ֻ��һ�У�����ַ���Ϊ��
" %b     ����µ��ַ���ʮ���Ʊ�ʾ��ʽ
" %c     �к�
" %f     ���������ļ�·��
" %h     ���Ϊ������������ʾΪ[Help]
" %l     �к�
" %m     ������������޸����ʾΪ[+]
" %n     ��������
" %o     �ڹ��ǰ���ַ�������������µ��ַ���
" %p     �ļ��������еİٷֱ�
" %r     ���������Ϊֻ�����ʾΪ[RO]
" %t     �ļ���(��·��)
" %v     ���к�
" %w     ���ΪԤ����������ʾΪ[Preview]
" %y     ���������ļ����ͣ���[vim]
" %{expr}     ���ʽ�Ľ��

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

" �������壬�ж�ϵͳ�Ͳ���
if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 12
elseif has("gui_macvim")
    set guifont=DejaVu_Sans_Mono:h12
elseif has("gui_win32")
    set guifont=Courier_New:h12:cANSI
end

" ���ļ������
if g:iswindows  
	au GUIEnter * simalt ~x
else    
	au GUIEnter * call MaximizeWindow()
endif 

function! MaximizeWindow()    
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �����vimrc�ļ�������������������ʽ��key bindings  
" ��ʽΪ��  
" ģʽ <��ݼ�> Ҫִ�е�����  
" ģʽ�����±�nmapΪ��ͨģʽ,imapΪ�༭ģʽ  
" C��ʾctrl,A��ʾAlt,S��ʾShift,<CR>��ʾ�س�,<Space>��ʾ�ո�,<leader>��ʾ|��������
" 
" �����������б�ʾ�ڡ�����||���ӻ�||���㡱ģʽ�£�����Ctrl+W,��ִ�����:tabclose���س��������ǹرյ�ǰ��ǩҳ  
" map <C-w> :tabclose<CR>  
"   
" �ֱ������б�ʾ�ڡ�����ģʽ���£�����Ctrl+t,  
" ������ִ��:browse(��ѡ���ļ��Ի��� tabnew��ѡ�����ļ����±�ǩҳ�д�  
" nmap <C-t> :browse tabnew<CR>  
"   
"   
" �������к�����һ����ֻ������Esc�ӱ༭ģʽ�л�������ģʽ  
" imap <C-t> <Esc>:browse tabnew<CR>  
"
""��һ��ӳ�����ֱ�Ӽ�ע�ͣ���Ϊ " �ַ�Ҳ��������ӳ���һ���֡�������� |" ��
"����һ���ơ���ʵ�����ǿ�ʼһ���µĿ��������:  
"
"	:map <Space> W|     " Use spacebar to move forward a word

" Ctrl+c ����
vnoremap <C-c> "+y 
" Ctrl+x     
vnoremap <C-x> "+d
" Ctrl+v ճ��
noremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
cnoremap <C-v> <C-r>+
" Ctrl+s ����
noremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>a
"�ж��Ƿ���gui,�ն���Щ���֧��,���� stty ȥ�����ն˵�����
if !(g:isGUI)
	" Ctrl+c ����
	unmap <C-c>
	" Ctrl+x     
	unmap <C-x>
	" Ctrl+v ճ��
	unmap <C-v>
	" Ctrl+s ����
	unmap <C-s>
endif

" Ctrl+d ���Ƶ�ǰ��
noremap <C-d> yyp
inoremap <C-d> <Esc>yypa
vnoremap <C-d> ykp
" ȫѡ
noremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVGa
"ctrl+z����
noremap <C-z> u
inoremap <C-z> <Esc>u
" Shift ���� [count] �α������ĸ��ġ�
noremap <S-z>  <Esc><C-r>
inoremap <S-z> <Esc><C-r>a
"�滻�ַ���
noremap <C-r> <Esc>:%s/
vnoremap <C-r> "+y<Esc>:%s/<C-r>"
" Alt+= �ѵ�ǰ���֮�ϻ�֮�����ֵ������ĸ���� [count]��
noremap <A-=> <C-a>
inoremap <A-=> <Esc><C-a>a
" Alt+- �ѵ�ǰ���֮�ϻ�֮�����ֵ������ĸ��ȥ [count]��
noremap <A--> <C-x>
inoremap <A--> <Esc><C-x>a
" clear the search buffer when hitting return
nnoremap <leader>/ <Esc>:nohlsearch<CR>
" ��ͼģʽʱ,��ѯ���Ƶ�ǰѡ��,�����ѯ
vnoremap <C-f> "+y<Esc>/<C-r>"
noremap <C-f> <Esc>/




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Winmanager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|BufExplorer'
"����winmanager�Ŀ�ȣ�Ĭ��Ϊ25
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
"���� :NERDTree �� NERDTree ����
"���ÿ�ݼ���
" o ��/�رչ������Ŀ¼
" t ���� tab �д��ļ�������ת���� tab
" T ���� tab �д��ļ���������ת���� tab
" p ��ת�����ڵ�
" P ��ת�����ڵ�
" q �ر� NERDTree ����
let g:NERDTree_title="[NERDTree]"
let NERDChristmasTree=1										" ����ʥ��������ʾ��ʽ
let NERDTreeAutoCenter=1									" ���Ƶ�����ƶ�����һ������ʱ���Ƿ��Զ������������������
"let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'	" ָ����ǩ�ļ�
let NERDTreeMouseMode=2										" ָ�����ģʽ(1.˫���� 2.��Ŀ¼˫�ļ� 3.������)
let NERDTreeShowBookmarks=1									" �Ƿ�Ĭ����ʾ��ǩ�б�
let NERDTreeShowFiles=1										" �Ƿ�Ĭ����ʾ�ļ�
let NERDTreeShowHidden=0									" �Ƿ�Ĭ����ʾ�����ļ�
let NERDTreeShowLineNumbers=0								" �Ƿ�Ĭ����ʾ�к�
let NERDTreeWinPos='left'									" ����λ�ã�'left' or 'right'��
let NERDTreeWinSize=24										" ���ڿ��
"let NERDTreeQuitOnOpen=1									" ��ͨ��NERD Tree���ļ��Զ��˳�NERDTree����
"nnoremap <Leader>nt :NERDTree<CR>		" <Leader> + nt	->��NERDTree����
"nmap <silent> <F3> :NERDTree<CR>		" <Leader> + nt	->��NERDTree����

""""""""""""""""""""""""""""""""""""""""""""""""""
" minibuffexploer
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   "<C-h,j,k,l>�л����������ҵĴ�����ȥ
let g:miniBufExplMapWindowNavArrows = 1  "<C-��ͷ>��ͷ�л�
"let g:miniBufExplMapCTabSwitchBufs = 1   "<C-Tab>�л�����(�г�ͻ)
"let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
"���ò���
" :e <filename> ���ļ�
" :ls    ��ǰ�򿪵�buf
" :bn    ��һ��buf
" :bp    ǰһ��buf
" :b<n>    n�����֣���n��buf
" :b<tab>    �Զ�����
" :bd    ɾ��
""""""""""""""""""""""""""""""""""""""""""""""""""
