let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)

  " UI related
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'machakann/vim-highlightedyank'

  " colorschemes
  "Plug 'phanviet/vim-monokai-pro'
  "Plug 'patstockwell/vim-monokai-tasty'
  "Plug 'nerdypepper/vim-colors-plain', { 'branch': 'duotone' }
  Plug 'srcery-colors/srcery-vim'
  "Plug 'morhetz/gruvbox'
  "Plug 'gruvbox-community/gruvbox'
  "Plug 'tomasr/molokai'
  "Plug 'sickill/vim-monokai'
  "Plug 'dracula/vim'
  "Plug 'chriskempson/base16-vim'

  "tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'

  "" repl
  "Plug 'Vigemus/iron.nvim'

  "" Better Visual Guide
  "Plug 'Yggdroot/indentLine'

  "" Better syntax
  " Plug 'numirias/semshi'
  " Plug 'nvim-treesitter/nvim-treesitter'

  "" git
  " Plug 'tpope/vim-fugitive'

  "" Autocomplete disable coc in julia files
  " Plug 'neoclide/coc.nvim', {'tag' : '*', 'do' : './install.sh'}

  "" Themes
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  "
  "" Vim Cheatsheet
  Plug 'liuchengxu/vim-which-key'

  "" Vim multi-cursor
  Plug 'terryma/vim-multiple-cursors'

  "" Devicon glyphs for Nerdtree
  Plug 'ryanoasis/vim-devicons'

  "" YAML support
  Plug 'stephpy/vim-yaml'

  "" Black code formatter
  Plug 'psf/black', {'tag' : '19.10b0'}

  "" slime to send commands to terminal
  Plug 'jpalardy/vim-slime'

  "" Julia support
  Plug 'JuliaEditorSupport/julia-vim', {'for' : 'julia'}
  "Plug 'mroavi/vim-julia-cell', { 'for': 'julia' }
  Plug 'kdheepak/JuliaFormatter.vim'

  ""Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

  "" Testing
  Plug 'vim-test/vim-test'

  "" waka waka time
  Plug 'wakatime/vim-wakatime'

  "" easy motions
  "Plug 'easymotion/vim-easymotion'

  "" floating terminal
  "Plug 'voldikss/vim-floaterm'

  "" Latex support
  Plug 'lervag/vimtex'

  "" github copilot
  " Plug 'github/copilot.vim'

  " Language server
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  " main one
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  let g:coq_settings = { 'auto_start': v:true }
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}


  call plug#end()

set encoding=UTF-8

filetype plugin indent on

"####################################################################
"##################### General vim settings #########################
"####################################################################


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
set autoindent

" colorscheme
"set background=dark
"colorscheme monokai
colorscheme srcery
"colorscheme gruvbox
"let g:gruvbox_contrast_dark="hard"
"highlight clear LineNr
"highlight clear SignColumn

" leader key
nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>

" NERDTree configs
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Lightline
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'readonly', 'relativepath', 'percent', 'modified' ],
      \            ],
      \   'right': [ [ ],
      \              [ 'filetype' ]],
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
      \ },
      \ }

" .rasi syntax
au BufNewFile,BufRead /*.rasi setf css

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
" Configurations Part"
"
" Use system python in virtual env
" Figure out the system Python for Neovim.
"if exists("$VIRTUAL_ENV")
"    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
"else
"    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
"endif
let g:python3_host_prog="/home/arnau/miniconda3/bin/python"

" UI configuration
syntax on
syntax enable

" vim which key
set timeoutlen=500

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

" which key can't figure out the easy-motion mappings
let g:which_key_map = {" ": 'easy motion (re-input to use)'}
" 

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif


"####################################################################
"######################### Python settings ##########################
"####################################################################
" Black
nmap <leader>b :Black<CR>
" test mappings
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy = "vimux"

"-----------------------------Julia settings---------------------------------
" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 0
"
"

lua << EOF
    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
        local opts = {}
    
        server:setup(opts)
    end)
    require'lspconfig'.julials.setup{}
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
    )
EOF

autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

"lua << EOF
"    require'nvim_lsp'.julials.setup{}
"EOF
""
"autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc
""
""" show diagnostics when hovering for too long
"autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
""
"nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
"nnoremap <silent> <leader>lk    <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>

" disable obnoxious underlining of everything in the damn universe
"let g:diagnostic_enable_underline = 0
"  (end Julia Language Server)

" julia-cell configuration
" Use '##' tags to define cells
"let g:julia_cell_delimit_cells_by = 'tags'
"
"" map <Leader>jr to run entire file
"nnoremap <Leader>jr :JuliaCellRun<CR>
"
"" map <Leader>jc to execute the current cell
"nnoremap <Leader>jc :JuliaCellExecuteCell<CR>
"
"" map <Leader>jC to execute the current cell and jump to the next cell
"nnoremap <Leader>jC :JuliaCellExecuteCellJump<CR>
"
"" map <Leader>jl to clear Julia screen
"nnoremap <Leader>jl :JuliaCellClear<CR>
"
"" map <Leader>jp and <Leader>jn to jump to the previous and next cell header
"nnoremap <Leader>jp :JuliaCellPrevCell<CR>
"nnoremap <Leader>jn :JuliaCellNextCell<CR>



"####################################################################
"######################### coc settings ##########################
"####################################################################
" TextEdit might fail if hidden is not set.

"disable in julia
"autocmd BufNew,BufEnter *.jl execute "silent! CocDisable"
"autocmd BufLeave *.jl execute "silent! CocEnable"
"
"" Give more space for displaying messages.
"set cmdheight=2
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300
"
"" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"" Use <TAB> for selections ranges.
"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
"" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"####################################################################
"######################### git settings ##########################
"####################################################################
"
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

"####################################################################
"######################### floaterm ##########################
"####################################################################
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

"####################################################################
"######################### slime ##########################
"####################################################################
" set slime target (tmux instead of screen)
let g:slime_target = "tmux"
" set target pane that code is sent to (optional)
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
nmap <c-c><c-x> :%SlimeSend<cr>
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>

"####################################################################
"######################### vimtex ##########################
"####################################################################
" settings for zathura
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_log_verbose = 1
"let g:vimtex_view_general_options
"    \ = '-reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'

"####################################################################
"######################### nvim-treesitter ##########################
"####################################################################
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
