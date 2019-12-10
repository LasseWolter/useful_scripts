if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" In case spacegray is not installed, install it
if empty(glob('~/.vim/pack/vendor/start/Spacegray'))
   !git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'  " file list
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'

"
"" Fast python completion(use ncm2 if you want type info or snippet support)
"Plug 'HansPinckaers/ncm2-jedi'
"" Words in buffer completion
"Plug 'ncm2/ncm2-bufword'
"" Filepath completion
"Plug 'ncm2/ncm2-path'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" path to your python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

">>>>>>>>>>>>>>NCM2 SETTINGS----------------------
"" ncm2 settings - only works with neovim
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=menuone,noinsert
"set shortmess+=c
"inoremap <c-c> <ESC>
"" Trigger popup manually 
""let g:ncm2#auto_popup = 0
""inoremap <C-Space> <c-r>=ncm2#manual_trigger()<cr>
"" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""
""" make it fast
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1, 1]]
""" Use new fuzzy based matches
"let g:ncm2#matcher = 'substrfuzzy'
"let g:ncm2#popup_limit = 5
"
"" Disable Jedi-vim autocompletion and enable call-signatures options
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"
""<<<<<<<<<<<<<<END NCM2 SETTINGS----------------------


">>>>>>>>>>>>>>>COC SETTINGS----------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"<<<<<<<<<<<<<<END COC SETTINGS----------------------


" Remappings
:imap jj <Esc>
:nnoremap <esc> :noh<return><esc>

" From Vim config website
set number      " Show line numbers
set linebreak   " Break lines at word(requires Wrap lines)
set showbreak=+++  " Wrap-broken line prefix
set textwidth=100       " Line wrap(number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell(no beeping)

set hlsearch    " Highlight all search results
set incsearch
set cpoptions+=x  " stay at seach item when < esc>
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set expandtab   " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

" Prevent text from automatically breaking a line
set textwidth=0
set wrapmargin=0

" Advanced
set ruler       " Show row and column ruler information

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tabs:
nnoremap tn :tabnew <Space>
nnoremap tk :tabnext <CR>
nnoremap tj :tabprev <CR>
nnoremap th :tabfirst <CR>
nnoremap tl :tablast <CR>

colorscheme spacegray

" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle <CR>
map <C-t> :set nosplitright <CR>:TagbarToggle<CR>:set splitright<CR>

" Pangloss java script plugin
let g:javascript_plugin_flow = 1

" Add fzf as vim-plugin
set rtp+=~/.fzf

" Add configurations for Ale Plugin
" Move between errors
nmap <silent> <C-k> :ALEPrevious -error<cr> 
nmap <silent> <C-j> :ALENext -error<cr>
nmap <silent> <F7> :ALEToggle<cr>

" Only lint when leaving insert mode - not constantly when typing
let g:ale_lint_delay = 20 
let g:ale_lint_on_insert_leave = 1 
let g:ale_fix_on_save = 0
" Cache checks - means you need to restart vim when adding new linter
let g:ale_cache_executable_check_failures=1

let g:ale_sign_error = '!!'
let g:ale_sign_warning = '.'

let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_linters = {}
let g:ale_fixers = {}
" Check Python files with flake8 - don't us pylint because it only works on
" saving the file - flake8 works in real time.
let g:ale_linters['python'] = ['flake8']
" Fix Python files with autopep8 and yapf.
let g:ale_fixers['python'] = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0

let g:ale_fixers['javascript'] = ['eslint']
nmap <C-L> <Plug>(ale_fix)

" to be able to paste without messing up the formatting
set pastetoggle=<F3>

" Disable flash on error
set t_vb =

