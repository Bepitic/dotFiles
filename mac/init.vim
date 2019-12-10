vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ñ l

noremap j h
noremap k j
noremap l k
noremap ñ l

noremap <tab> <C-w>w
noremap <S-tab> <C-w>W

set number
set relativenumber

set cursorline
" set cursorcolumn

let mapleader = "\<space>"

noremap <leader>s m1gg=G'1:w<CR>
noremap <leader>r :so ~/.config/nvim/init.vim<CR>
noremap <leader><left> :tabp<cr>
noremap <leader><right> :tabn<cr>
nnoremap <esc> :noh<return><esc>

nnoremap <S-up> :resize -2<cr>
nnoremap <S-down> :resize +2<cr>
nnoremap <S-left> :vertical resize -2<cr>
nnoremap <S-right> :vertical resize +2<cr>

set tabstop=2
set shiftwidth=2
set expandtab


call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'aserebryakov/vim-todo-lists'
Plug 'gilsondev/searchtasks.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"
"let g:airline_theme='solarized_flood'
map <leader>n :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vim', 'green', 'none', 'green', '#151515')

call NERDTreeHighlightFile('cpp', 'blue', 'none', 'green', '#151515')
call NERDTreeHighlightFile('hpp', 'green', 'none', 'green', '#151515')

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_cpp_compiler_options = "-std=c++11"

colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set bg=dark
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
