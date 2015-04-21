"=========================================
" Start Vundle
"=========================================

" https://github.com/gmarik/vundle#readme
" filetype off  " Required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Self-manage Vundle
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'

"=========================================
" Loads Working Env Specific Confgi
"=========================================

if finddir('google', '/') != ''
  " Loads google interval config
  source $HOME/.vimrc.google
else
  source $HOME/.vimrc.zzb
endif

"=========================================
" Common Configuration "
"=========================================

" Notes:
" All file jumping/searching key mapping starts with ,,


" Source vimrc when saved
autocmd! bufwritepost .vimrc source %

set noswapfile

" Basic format settings
set colorcolumn=+1
filetype on
filetype plugin indent on  " or filetype plugin on if you prefer
syntax on
set nu
set cursorline
set mouse=a
inoremap <C-n> <Del>

" Search setting
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap ,h :nohl<CR>

" In case of typo
command! W w
command! WQ wq
command! Wq wq
command! Q q
command! Qa qa
command! QA qa

" Key mapping for panel switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap gH :vertical resize-10<CR>
nmap gL :vertical resize+10<CR>
nmap gJ :resize-10<CR>
nmap gK :resize+10<CR>

" Window manager config
let g:winManagerWindowLayout='FileExplorer'
nmap gm :WMToggle<CR>

" Setting for code folding
" za/zA to toggle
" zm/zM/zr/zR to change fold level
" zj/zk/[z/]z to move
set foldmethod=indent
nnoremap z<space> za
nnoremap z<space> @=((foldclosed(line('.')) < 0) ? 'zC' : 'zO')<CR>

" Paste setting
set pastetoggle=<F9>
nmap <Leader>p "+p
nmap <Leader>y "+y
nmap <Leader><Leader>p "5p
nmap <Leader><Leader>y "5y

" Misc key mapping
" nmap ,, :w<CR>:sh<CR>
nmap ,a :ConqueTermSplit bash<CR>

" What's this?
xnoremap p pgvy

" ====== Bundles & Corresponding config ====

" L9 is Deps
Bundle 'L9'
Bundle 'vim-scripts/a.vim'
Bundle 'Valloric/MatchTagAlways'
Bundle 'plasticboy/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
" Use + to expand current visual selection
Bundle 'terryma/vim-expand-region'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd="CtrlP"
set wildignore+=*.so,*.swp,*.zip
nmap ,,f :CtrlP<CR>

Bundle 'terryma/vim-multiple-cursors'
" let g:multi_cursor_next_key =
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Space>'
nmap <Space><Space> <Space>f
" Color setting.
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

Bundle 'FuzzyFinder'
nmap ,,l :FufLine<CR>
nmap ,,b :FufBuffer<CR>
nmap ,,j :FufJumpList<CR>
nmap ,,c :FufChangeList<CR>
nmap ,,g :FufBufferTagAll<CR>

" Misc is a dep
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
let g:session_autosave = 'no'
let g:session_autoload = 'no'

Bundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

Bundle 'Lokaltog/vim-powerline'
set laststatus=2

Bundle "Yggdroot/indentLine"
Bundle "godlygeek/csapprox"
Bundle "jaromero/vim-monokai-refined"
set t_Co=256

if(has("gui_running"))
  " colorscheme solarized
  " set background=dark
  colorscheme molokai
else
  " colorscheme desert256
  let g:rehash256 = 1
  " colorscheme molokai
  colorscheme CodeFactoryv3
endif
" Transparent background.
hi Normal ctermfg=252 ctermbg=none
" Change color of ColorColumn
highlight ColorColumn ctermbg=8
highlight SignColumn ctermbg=none
" Change color of SpellBad
hi clear SpellBad
hi SpellBad cterm=underline
" hi SpellBad cterm=underline
" hi SpellBad ctermfg=14
set spell

set ic

source ~/.vim/c.vim

" Config for vimgrep
" function g:vimgrep_shortcut(exp)
"   exe 'vimgrep /'.a:exp.'/j **'
"   copen
" endfunction
" function g:vimgrep_loc_shortcut(exp, loc)
"   exe 'vimgrep /'.a:exp.'/j '.a:loc
"   copen
" endfunction
" command -nargs=* VimGrepShortCut call g:vimgrep_shortcut(<f-args>)
" command -nargs=* VimGrepLocShortCut call g:vimgrep_loc_shortcut(<f-args>)
" nmap <Leader>g :VimGrepShortCut 
" nmap <Leader><Leader>g :VimGrepLocShortCut 
nmap <Leader>c :cclose<CR>


let g:blazevim_notify_after_blaze = 1

nnoremap ,cs :!google-chrome --new-tab https://cs.corp.google.com/'<cword>'<CR><CR>

command! -nargs=+ NewGrep execute 'silent grep! <args>' | copen

" Bundle 'mileszs/ack.vim'
" nmap ,,a  :execute 'Ack --ignore-dir=testdata --ignore-dir=config --ignore-dir=absinthe_shot ' . expand('<cword>') <CR>
" nmap ,,A  :Ack --ignore-dir=testdata --ignore-dir=config --ignore-dir=absinthe_shot 

Bundle "vim-scripts/argtextobj.vim"
Bundle "bkad/CamelCaseMotion"
" Bundle 'spiiph/vim-space'

Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-h>"

Bundle 'tomasr/molokai'
" Bundle 'yonchu/accelerated-smooth-scroll'
" Bundle 'vim-scripts/cmdline-completion'
" <Leader>ig
Bundle 'nathanaelkane/vim-indent-guides'  


" Auto insert )]} and auto indent when new line.
" <c-h> conflict
Bundle 'jiangmiao/auto-pairs'


" Text-Object usage: i( i[ i{
" cs ds ysiw
" visual, then S}
Bundle "tpope/vim-surround"

" <c-p> <c-n> after pasting
" :YRShow
Bundle "vim-scripts/YankRing.vim"
let g:yankring_replace_n_nkey = '<C-P>'

" :GundoToggle
Bundle "sjl/gundo.vim"

" https://github.com/MattesGroeger/vim-bookmarks
" Bundle 'MattesGroeger/vim-bookmarks'



:nnoremap <C-I> <C-a>

" Use \m to highlight words under cursor, \n to clear marks
Bundle 'vim-scripts/Mark'




" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=100
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

function! s:GPyLint()
  let a:lint = '/usr/bin/gpylint '
      \. '--msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}"'
  cexpr filter(split(system(a:lint . ' ' . expand('%')), '\n'),
      \ 'v:val =~ "[^:]:\\d\\+:"')
  copen
  setl cursorline
  cc  
endfunction
au FileType python command! Lint :call s:GPyLint()
" autocmd FileType python autocmd BufWritePost <buffer> call s:GPyLint()

" :FixWhitespace
Bundle 'bronson/vim-trailing-whitespace'

" Colors for () [] {}
Bundle 'kien/rainbow_parentheses.vim'
" let g:rbpt_colorpairs = [
    " \ ['brown',       'RoyalBlue3'],
    " \ ['Darkblue',    'SeaGreen3'],
    " \ ['darkgray',    'DarkOrchid3'],
    " \ ['darkgreen',   'firebrick3'],
    " \ ['darkcyan',    'RoyalBlue3'],
    " \ ['darkred',     'SeaGreen3'],
    " \ ['darkmagenta', 'DarkOrchid3'],
    " \ ['brown',       'firebrick3'],
    " \ ['gray',        'RoyalBlue3'],
    " \ ['black',       'SeaGreen3'],
    " \ ['darkmagenta', 'DarkOrchid3'],
    " \ ['Darkblue',    'firebrick3'],
    " \ ['darkgreen',   'RoyalBlue3'],
    " \ ['darkcyan',    'SeaGreen3'],
    " \ ['darkred',     'DarkOrchid3'],
    " \ ['red',         'firebrick3'],
    " \ ]
let g:rbpt_colorpairs = [
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Repeate plugin op
Bundle 'tpope/vim-repeat'

" Bookmark
Bundle 'kshenoy/vim-signature'

" Press <leader>mt or run :TMToggle to toggle TabMan.
" Press <leader>mf or run :TMFocus to give focus to/open the TabMan window.
Bundle 'kien/tabman.vim'

Bundle 'vim-scripts/django.vim'

" 102 109
highlight Search ctermbg=95


Bundle 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_indent = 1
let g:tagbar_left = 0
let g:tagbar_sort = 0
let g:tagbar_compact = 1
nmap <Leader>t :TagbarOpenAutoClose<CR>
nmap <Leader>T :TagbarToggle<CR>
" Auto open tagbar if the file is supported.
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" Install ag would be much faster
Bundle 'dyng/ctrlsf.vim'
nmap ,,p <Plug>CtrlSFCwordPath
nmap ,,P :CtrlSF -i 

" <c-w>o Turns panel to fullscreen.
Bundle 'ZoomWin'

" Visual select sth and press '*' or '#'
Bundle 'thinca/vim-visualstar'

" A RGB/HSV color selector 
" Bundle 'vim-script/colorsel.vim'

" Deprecated: by vim-swoop
" Search and list buffer content.
" <Leader>lf  - Opens filesystem explorer.
" <Leader>lr  - Opens filesystem explorer at the directory of the current file.
" <Leader>lb  - Opens buffer explorer.
" <Leader>lg  - Opens buffer grep.
" <C-n>/<C-p> to select the next/previous match
" Bundle 'sjbach/lusty'

" Auto complete for searching.
Bundle 'vim-scripts/SearchComplete'

" Bundle 'pelodelfuego/vim-swoop'
" noremap ,,r :call SwoopCurrentBuffer()<CR>
" noremap ,,R :call SwoopAllBuffer()<CR>
" highlight CursorLine term=bold

" Patch to current colorschema
" hi CursorLine cterm=none ctermbg=black



" Bundle 'vim-scripts/Conque-GDB'
" nmap <Leader>rr :call conque_gdb#command('target remote localhost:1238')<CR>
"
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
