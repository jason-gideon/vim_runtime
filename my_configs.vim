 "==================================
 ""    Vim基本配置
 "===================================
 ""关闭vi的一致性模式 避免以前版本的一些Bug和局限
 set nocompatible
 ""主题配色
 "set background=dark
 "colorscheme solarized
 ""显示行号
 set number
 "设置在编辑过程中右下角显示光标的行列信息
 set ruler
 ""在状态栏显示正在输入的命令
 "set showcmd
 "搜索时高亮显示
 set hls
 "突出现实当前行列
 set cursorline
 "set cursorcolumn
 ""设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
 set showmatch
 "设置C/C++方式自动对齐
 set autoindent
 set cindent
 set smartindent
 ""开启语法高亮功能
 syntax enable
 syntax on
 "指定配色方案为256色
 set t_Co=256
 ""设置搜索时忽略大小写
 set ignorecase
 "设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
 "set mouse=a
 ""设置Tab宽度
 set tabstop=2
 "设置自动对齐空格数
 set shiftwidth=2
 ""设置按退格键时可以一次删除4个空格
 set softtabstop=2
 "设置按退格键时可以一次删除4个空格
 "set smarttab
 ""将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
 set expandtab
 "设置编码方式
 set termencoding=utf-8
 set encoding=utf-8
 ""自动判断编码时 依次尝试一下编码
 set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
 "检测文件类型
 filetype off
 ""针对不同的文件采用不同的缩进方式
 filetype plugin indent on
 
 set tags=tags;/


"==================================
""    Vim 插件配置
"===================================

"NERDTree
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F8> :NERDTreeToggle<CR>


"TAGLIST WITH GO
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'


"TAGLIST
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidth =30                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Left_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open=1
let Tlist_Auto_Update=1
let Tlist_Sort_Type="name"
let Tlist_Process_File_Always=1         "taglist始终解析文件中的tag，不管taglist是否打开

nnoremap <silent> <F3> :Tlist<CR>


"TAGBAR (golang)
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

nnoremap <silent> <F2> :TagbarToggle<CR>


"AIRLINE
"let g:airline_theme="molokai"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0    " 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#symbol = '!'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
 
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
 
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
 
" Go related mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)

"VIM-GO
let g:go_auto_sameids = 1

map <C-n> :GoCallers<CR>
