let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)

  " UI related
  Plug 'chriskempson/base16-vim'
"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'christoomey/vim-tmux-navigator'                                   " Navigate between tmux and vim with <C>+jkhl

  " colorschemes
  Plug 'phanviet/vim-monokai-pro'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'nerdypepper/vim-colors-plain', { 'branch': 'duotone' }

  "tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'

  " Better Visual Guide
  Plug 'Yggdroot/indentLine'

  " Better syntax
  "Plug 'sheerun/vim-polyglot'
  Plug 'numirias/semshi'

  " syntax check
  Plug 'w0rp/ale'

  " Autocomplete
  Plug 'neoclide/coc.nvim', {'tag' : '*', 'do' : './install.sh'}

  " Formatter
  Plug 'Chiel92/vim-autoformat'

  " Themes
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'dylanaraps/wal.vim'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  
  " Vim Cheatsheet
  Plug 'liuchengxu/vim-which-key'

  " Vim multi-cursor
  Plug 'terryma/vim-multiple-cursors'

  " UltiSnips vim snippets
  "Plug 'SirVer/ultisnips'

  " Devicon glyphs for Nerdtree
  Plug 'ryanoasis/vim-devicons'

  " YAML support
  Plug 'stephpy/vim-yaml'

  " Black code formatter
  Plug 'psf/black', {'tag' : '19.10b0'}


  " Julia support
  Plug 'JuliaEditorSupport/julia-vim'
  "Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

  " Surround
  Plug 'tpope/vim-surround'

  " Testing
  Plug 'vim-test/vim-test'

  " waka waka time
  Plug 'wakatime/vim-wakatime'
  " folding
  "Plug 'tmhedberg/SimpylFold'
  "
  "Tags
  Plug 'majutsushi/tagbar'

  " smooth scroll
  Plug 'yuttie/comfortable-motion.vim'


  call plug#end()

set encoding=UTF-8

filetype plugin indent on

" Configurations Part"

" UI configuration
syntax on
syntax enable

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
"if has("gui_running")
"  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
"endif

" colorscheme
" for dark version
set background=dark
" set contrast
"let g:gruvbox_material_background = 'hard'
"let g:vim_monokai_tasty_italic = 1
colorscheme monokai_pro
highlight clear LineNr
highlight clear SignColumn
"hi LineNr ctermbg=dark
" colorscheme wal

" leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

"Julia settings
"
let g:default_julia_version = '1.4'
" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 0
noremap <Leader>f :call julia#toggle_function_blockassign()<CR>

" language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \       debug = false; 
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());       
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }
" 
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" Italics for palenight
"let g:palenight_terminal_italics = 1

" test mappings
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy = "vimux"

"folding
"set foldmethod=indent   
"set foldnestmax=10
""set nofoldenable
"set foldlevel=2


"set termguicolors
set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>

" NERDTree configs
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Black
noremap <C-b> :Black <CR>

" Airline
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''
"let g:airline#extensions#ale#enabled = 1
"let airline#extensions#ale#error_symbol = 'E:'
"let airline#extensions#ale#warning_symbol = 'W:'
"let g:airline_theme = 'wal' 

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'readonly', 'relativepath', 'percent', 'modified' ],
      \            ],
      \   'right': [ [ ],
      \              [ 'filetype' ],
      \              [ 'tagbar' ] ]
      \   },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'gitbranch': 'fugitive#head',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'tab': {
      \   'active': [ 'filename', 'modified' ],
      \   'inactive': [ 'filename', 'modified' ],
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'gitbranch' ] ],
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \ },
      \ 'component_type': {
      \   'buffercurrent': 'tabsel',
      \   'bufferbefore': 'raw',
      \   'bufferafter': 'raw',
      \ },
      \ 'component': {
      \   'separator': '',
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ }

" .rasi syntax
au BufNewFile,BufRead /*.rasi setf css

" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Control vim window splits with Alt + Arrow
map <leader>k  :wincmd k<CR>
map <leader>j  :wincmd j<CR>
map <leader>h  :wincmd h<CR>
map <leader>l  :wincmd l<CR>

" Vim tabs
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Vimux config
let g:VimuxOrientation = "v"
map <Leader>vl :VimuxRunLastCommand<CR>

" Clipboard management
" Copy to system clipboard
vnoremap  <leader>y  "+y
vnoremap  <leader>Y  "+yg$
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard
nnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
nnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>
vnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
vnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>

" coc settings
" TextEdit might fail if hidden is not set.

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
