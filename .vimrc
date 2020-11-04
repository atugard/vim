function Plugins()
  call plug#begin('~/.vim/plugged')
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'jaredgorski/spacecamp'
  Plug  'jceb/vim-orgmode'
  Plug 'tpope/vim-speeddating'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neovimhaskell/haskell-vim'
  Plug 'tpope/vim-surround'
  Plug 'ap/vim-buftabline'
  Plug 'preservim/nerdtree'

  call plug#end()
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
function Options()
  set number relativenumber
  syntax on 
  filetype plugin indent on
  set tabstop=2
  set shiftwidth=2
  set expandtab
  colorscheme spacecamp
  set hidden
  set nobackup
  set nowritebackup
  set cmdheight=2
  set updatetime=300
  set shortmess+=c
  " Always show the signcolumn, otherwise it would shift the text each time
  set signcolumn=number
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endfunction
function Keys() 
  let g:mapleader= " "
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
  nnoremap <leader>b :buffers<CR>:buffer<Space>
  nnoremap <leader>e :NERDTreeToggle <CR>
  nnoremap <leader>s :source ~/.vimrc <CR>
  nnoremap <leader>w :w! <CR>
  nnoremap <leader>q :q! <CR>
  nnoremap <leader>v :vsp <CR>
  nnoremap <C-j> <C-w><DOWN>
  nnoremap <C-k> <C-w><UP>
  nnoremap <C-h> <C-w><LEFT>
  nnoremap <C-l> <C-w><RIGHT>
  nnoremap <leader>h :bnext<CR>
  nnoremap <leader>l :bprev<CR>
  nnoremap <leader>c :bd! <CR>
  nnoremap <leader>1 :b 1 <CR>
  nnoremap <leader>2 :b 2 <CR>
  nnoremap <leader>3 :b 3 <CR>
  nnoremap <leader>4 :b 4 <CR>
  nnoremap <leader>5 :b 5 <CR>
  nnoremap <leader>6 :b 6 <CR>
  vnoremap <C-y> "+y
  nnoremap <C-p> "+p
  inoremap <C-p> "+p
  imap sd <Esc>ll
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-@> coc#refresh() 
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

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)

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

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

endfunction
function Autocmds()
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
  augroup END
  autocmd InsertEnter,InsertLeave * set cul!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
endfunction
function Commands()
  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
endfunction
function Calls()
  call Plugins()
  call Options()
  call Keys()
  call Autocmds()
endfunction


call Calls()
