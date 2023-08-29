"===== ===== ===== ===== ===== ===== ===== ===== normal settings
inoremap jk <ESC>
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
"set cursorline
"set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell t_vb=
set showmatch
"set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable
set background=dark
"colorscheme hybrid
"colorscheme molokai
colorscheme iceberg_
"colorscheme base16-default-dark

"function! s:base16_customize() abort
"  call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
"endfunction
"
"augroup on_change_colorschema
"  autocmd!
"  autocmd ColorScheme * call s:base16_customize()
"augroup END

"colorscheme iceberg.vim



set t_Co=256
"set termguicolors
set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2
"set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set synmaxcol=10000
set syntax=sync
set re=0


"colorscheme tokyonight
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"let g:lightline = {'colorscheme' : 'tokyonight'}
"let g:airline_theme = "tokyonight"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"===== ===== ===== ===== ===== ===== ===== =====






"===== ===== ===== ===== ===== ===== ===== ===== dein settings
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
"let s:dein_base = '/Users/sakiyamatokio/.cache/dein'

" Set Dein source path (required)
"let s:dein_src = '/Users/sakiyamatokio/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
"execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
"call dein#begin(s:dein_base)
"call dein#add(s:dein_src)

" Your plugins go here:






"----- ----- ----- ----- ----- ----- ----- -----
" dein.vim settings {
" install dir {
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }

" dein installation check { if &runtimepath !~# '/dein.vim'
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
   execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
 endif
 execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }

" begin settings {
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)
 
 " .toml file
 let s:rc_dir = expand('~/.vim')
 if !isdirectory(s:rc_dir)
   call mkdir(s:rc_dir, 'p')
 endif
 let s:toml = s:rc_dir . '/dein.toml'
 " read toml and cache
 call dein#load_toml(s:toml, {'lazy': 0})
 " end settings
 call dein#end()
 call dein#save_state()
endif
" }

" plugin installation check {
if dein#check_install()
 call dein#install()
endif
" }

" plugin remove check {
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
 call map(s:removed_plugins, "delete(v:val, 'rf')")
 call dein#recache_runtimepath()
endif
" }
" }

" enable colorscheme {
"syntax enable
"colorscheme zenburn
" }

" key mapping {
"nmap <C-p> <Plug>AirlineSelectPrevTab
"nmap <C-n> <Plug>AirlineSelectNextTab
"nmap <Leader> <Plug>(easymotion-prefix)
"nmap - <C-w>s
"nmap <Bar> <C-w>v
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l
"nmap <C-c> <C-w>c
"nmap <Space><Space> :LspCodeAction<Return>
"nmap <Space>n :LspNextDiagnostic<Return>
"nmap <Space>p :LspPreviousDiagnostic<Return>
"nmap <tab><tab> :NERDTreeToggle<Return>
" }

" airline {
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_idx_format = {'0': '0 ', '1': '1 ', '2': '2 ', '3': '3 ', '4': '4 ', '5': '5 ', '6': '6 ', '7': '7 ', '8': '8 ', '9': '9 '}
"set ttimeoutlen=50
" }

" install deno if it haven't been installed {
if glob(expand('~/.deno/bin/deno'))
  execute '!curl -fsSL https://deno.land/install.sh | sh'
endif
" }

" ddc {
"call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'vim-lsp',
  \ 'file'
  \ ])
call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'matchers': ['matcher_head'],
  \   'sorters': ['sorter_rank'],
  \   'converters': ['converter_remove_overlap'],
  \ },
  \ 'around': {'mark': 'Around'},
  \ 'vim-lsp': {
  \   'mark': 'LSP',
  \   'matchers': ['matcher_head'],
  \   'forceCompletionPattern': '\.|:|->|"\w+/*',
  \  },
  \ 'file': {
  \   'mark': 'file',
  \   'isVolatile': v:true, 
  \   'forceCompletionPattern': '\S/\S*'
  \ }})
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sourceParams', #{
        \   around: #{ maxSize: 500 },
        \   vim-lsp: #{maxSize: 500},
        \   file: #{maxSize: 500},
        \ })
call ddc#custom#patch_filetype(['css'], {
   \ 'sourceParams': {
   \   'vim-lsp': {
   \     'ignoreCompleteProvider': v:true,
   \   },
   \ },
   \ })
call ddc#enable()
" }

" lsp {
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8'],
\         'plugins': {
\           'flake8': {'enabled':v:true},
\           'pyflakes': {'enabled':v:false},
\           'pycodestyle': {'enabled':v:false},
\         }
\       }
\     }
\   },
\}

" Hide signcolumn.
"let g:lsp_diagnostics_signs_enabled = 0
" Show diagnostics message to status line
"let g:lsp_diagnostics_echo_cursor = 1
" Highlight LSP warnings strongly (like errors)
"highlight link LspWarningHighlight Error
" }

" set {
"set nobackup
"set noswapfile
"set autoread
" set }

"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"----- ----- ----- ----- ----- ----- ----- -----

let g:markdown_fenced_languages = ['ts=typescript']
" let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'deno']

" Finish Dein initialization (required)
"call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif
"===== ===== ===== ===== ===== ===== ===== =====


"===== ===== ===== neosnipet ===== ===== =====
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"===== ===== ===== ===== ===== ===== ===== =====




" ============================== go / javascript / typescript ==============================
" global setting {{{1
" ==============================================================================
let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#closepreview')]
let g:lsp_preview_autoclose = 0

let g:lsp_highlight_references_enabled = 1
highlight lspReference cterm=undercurl gui=undercurl

let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '🧨'}
let g:lsp_signs_warning = {'text': '⚠️'}
let g:lsp_signs_information = {'text': 'ℹ️'}
let g:lsp_signs_hint = {'text': '💡'}

let g:lsp_async_completion = 1

" highlight {{{1
" ==============================================================================
highlight LspErrorHighlight term=underline cterm=underline gui=underline
highlight link LspErrorText GruvboxRedSign
highlight lspReference term=underline cterm=underline

highlight PopupWindow ctermfg=LightCyan ctermbg=Magenta guibg=NONE guifg=LightCyan
augroup lsp_float_colours
    autocmd!
    autocmd User lsp_float_opened
                \ call win_execute(lsp#ui#vim#output#getpreviewwinid(),
                \		       'setlocal wincolor=PopupWindow')
augroup end

" filetypes {{{1
" ==============================================================================

" go {{{2
" ==============================================================================
" if executable('gopls')
"     augroup LspGo
"         au!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'go-lang',
"                     \ 'cmd': {server_info->['gopls']},
"                     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'go.mod'))},
"                     \ 'allowlist': ['go'],
"                     \ 'workspace_config': {'gopls': {
"                     \     'staticcheck': v:false,
"                     \     'completeUnimported': v:true,
"                     \     'caseSensitiveCompletion': v:true,
"                     \     'usePlaceholders': v:true,
"                     \     'completionDocumentation': v:true,
"                     \     'watchFileChanges': v:true,
"                     \     'hoverKind': 'SynopsisDocumentation',
"                     \     'deepCompletion': v:true,
"                     \ }},
"                     \ })
"         autocmd FileType go setlocal omnifunc=lsp#complete
"         "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
"         "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
"         "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
"     augroup END
" elseif executable('bingo')
"     augroup LspGo
"         au!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'go-lang',
"                     \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
"                     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
"                     \ 'allowlist': ['go'],
"                     \ })
"         autocmd FileType go setlocal omnifunc=lsp#complete
"     augroup END
" else
"     :echomsg "vim-lsp for go unavailable"
" endif

" javascript {{{2
if executable('typescript-language-server')
    augroup LspJavascript
        au!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'javascript-language-server',
                    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
                    \ 'allowlist': ['javascript', 'javascript.jsx'],
                    \ })
        autocmd FileType javascript setlocal omnifunc=lsp#complete
    augroup END
else
    :echomsg "vim-lsp for javascript unavailable"
endif

" typescript {{{2
if executable('typescript-language-server')
    augroup LspTypeScript
        au!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'typescript-language-server',
                    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
                    \ 'allowlist': ['typescript'],
                    \ })
        autocmd FileType typescript setlocal omnifunc=lsp#complete
    augroup END
else
    :echomsg "vim-lsp for typescript unavailable"
endif

" efm {{{2
if executable('efm-langserver')
  augroup LspEFM
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'efm-langserver',
        \ 'cmd': {server_info->['efm-langserver', '-c='.$HOME.'/.config/efm-langserver/config.yaml']},
        \ 'allowlist': ['go'],
        \ })
  augroup END
endif
" ============================== javascript / typescript ==============================
