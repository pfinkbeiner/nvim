" Options
syntax on
let g:solarized_termcolors=256
set background=dark
filetype plugin indent on

set nu
set incsearch
set encoding=utf-8
set hlsearch
set noerrorbells
set novisualbell
set nobackup
set nowritebackup

" Save on SHIFT+W
cabb W w
cabb Q q

" SWAP files
set directory=~/.vim/swap

call plug#begin()
" Themes
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-test/vim-test'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'amadeus/vim-mjml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'kchmck/vim-coffee-script'
Plug 'google/vim-searchindex'

Plug 'neoclide/jsonc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}

" Plug 'prettier/vim-prettier', {
" 			\ 'do': 'yarn install --frozen-lockfile --production',
" 			\ 'branch': 'release/0.x'
" 			\ }
"     ▸  coc.nvim/
"     ▸  fzf/
"     ▸  phpactor/
"     ▸  vim-lsp/
Plug 'sjl/gundo.vim'
Plug 'stephpy/vim-php-cs-fixer'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'elmar-hinz/vim.typoscript'
Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()

colorscheme gruvbox

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
au BufNewFile,BufReadPost,FilterReadPost,FileReadPost  * set nospell

autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.html set ft=xml
autocmd BufRead,BufNewFile *.hbs set ft=mustache
autocmd BufRead,BufNewFile *.handlebars set ft=mustache
autocmd BufRead,BufNewFile *.typoscript set ft=typoscipt
autocmd BufRead,BufNewFile setup.ts set ft=typoscript
autocmd BufRead,BufNewFile constants.ts set ft=typoscript
autocmd BufRead,BufNewFile setup.txt set ft=typoscript
autocmd BufRead,BufNewFile constants.txt set ft=typoscript
autocmd BufRead,BufNewFile Jenkinsfile set ft=groovy tabstop=2 number shiftwidth=2 textwidth=0
autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
autocmd FileType mail set tw=72 sw=4 tabstop=4 expandtab spell nu
autocmd FileType ruby set tw=72 sw=2 tabstop=2 expandtab spell nu
autocmd FileType jade set tw=0 sw=2 tabstop=2 expandtab spell nu
autocmd FileType pug set tw=0 sw=2 tabstop=2 expandtab spell nu
autocmd FileType stylus set tw=0 sw=2 tabstop=2 expandtab spell nu
autocmd FileType text set tw=72 sw=4 tabstop=4 expandtab spell
autocmd FileType tex  set tw=80 nu tabstop=4 sw=4 expandtab nu spell
autocmd FileType cpp set tw=0 cindent nu sw=4
autocmd FileType make set tw=0
autocmd FileType awk set tw=0
autocmd FileType dot set tw=0
autocmd FileType html set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab tw=0 number
autocmd FileType mjml set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab tw=0 number
autocmd FileType xml set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab textwidth=0 number
autocmd FileType scss set softtabstop=2 shiftwidth=2 expandtab number
autocmd FileType yaml set softtabstop=2 shiftwidth=2 expandtab number
autocmd FileType typoscript set tabstop=2 textwidth=0 shiftwidth=2 softtabstop=2 number noexpandtab commentstring=#\ %s
autocmd FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab textwidth=0 number
autocmd FileType erlang set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0 number
autocmd FileType elixir set number formatprg="mix\ format\ -"
autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0 number
autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=0 number
autocmd FileType vue set tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=0 number
autocmd FileType coffee set tabstop=2 shiftwidth=2 number expandtab
autocmd BufRead,BufNewFile *.ts set ft=typescript
autocmd BufNewFile,BufRead *.ejs set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab tw=0 number filetype=html

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" autocmd FileType vue set number

" let g:vim_vue_plugin_load_full_syntax = 0
" let g:vim_vue_plugin_use_sass = 1
" let g:vim_vue_plugin_use_scss = 1
" let g:vim_vue_plugin_use_coffee = 1
" let g:vim_vue_plugin_use_typescript = 1
" let g:vim_vue_plugin_highlight_vue_attr  = 1
" let g:vim_vue_plugin_highlight_vue_keyword = 1

" Example: set local options based on subtype
function! OnChangeVueSubtype(subtype)
  echom 'Subtype is '.a:subtype
  if a:subtype == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  elseif a:subtype =~ 'coffee'
    setlocal commentstring=#%s
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [
          \ 'ruby',
          \ 'javascript',
          \ 'json',
          \ 'scss'
      \ ],
      \ 'passive_filetypes': [
          \ 'puppet',
          \ 'php',
          \ 'sh',
          \ 'xml'
      \ ]
  \ }

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

" " Indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_auto_colors = 0
"hi IndentGuidesEven ctermbg=darkgrey


" nerdtree
function! NERDTreeToggleInCurDir()
  exe ":NERDTreeToggle"
  exe ":NERDTreeCWD"
endfunction
map <C-n> :call NERDTreeToggleInCurDir()<CR>

" nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nf :call NERDTreeToggleInCurDir()<cr>

" gundo
nnoremap <C-G> :GundoToggle<CR>

" Disable arrow keys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" Autoreload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,init.vim,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" CtrlP:
" 0 - don’t manage working directory.
" 1 - the parent directory of the current file.
" 2 - the nearest ancestor that contains one of these directories or
" files: .git/ .hg/ .svn/ .bzr/ _darcs/
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = '\v\(\.git|node_modules|bower_components\)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|webpagetest|bower_components|_build|deps$',
  \ 'file': '\.beam$\'
  \ }

let g:mix_format_on_save = 1

" Prettier setup
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat_config_present = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.vue Prettier

""""""""" COC LSP
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
