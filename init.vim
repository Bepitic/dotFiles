
" Configuracion neovim by:Bepitic
" TODO: Mejorar la distribucion de comentarios dentro de los plugins
" TODO: Poner comentarios explicando que hace cada plugin.

set showcmd
" Abrir/Cerrar un fold, zo zc / o intentando mover el cursor horizontalmente
  " Tips NeoVim/Vim {
  " Abrir/Cerrar todos los fold del cursor zO zC
  " / o intentando mover el cursor horizontalmente
  " Dentro de help para ir a un 'hipervinculo' usar Ctrl-]
  " y para volver al apartado anterior usar Ctrl-t
  " Abrir un nuevo fichero en un tab nuevo, :tabedit {file}
  " dividir la pantalla de forma vertical :vs {file}
"}

" Mapear las teclas en diferentes modos y el leader a espacio
  " MapArrowKeys&leader {
  let mapleader = "\<Space>"
  " Al borrar la linea la linea inferior se pone en la actual.
  " Borrar la linea ir una linea arriva y pegar encima
  no <up> ddkP
  " Ir a la siguiente pestaña
  no <right> gt
  " Borrar la linea y pegar abajo
  no <Down> ddp
  " Ir a la pestaña anterior
  no <left> gT
  "Mapear las ArrowKeys para que no hagan nada en insert mode
  ino <up> <Nop>
  ino <left> <Nop>
  ino <Down> <Nop>
  ino <right> <Nop>
" }

" Numeracion en las lineas de forma relativa a la linea actual 
" y con la linea actual con numeracion
  " Numeric_Lines {
  set relativenumber
  set number
  " }

syntax enable

  " Plugins {
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.config/nvim/plugged')
    " ctrl-p Tips.
    " :CtrlPBuffer -> abre busca en todos los buffers abiertos
    " :CtrlPMRUFiles -> busca por los archibos mas recientemente usados
    " con el CtrlP abierto:
    " ctrl k/j para elejir un fichero en concreto
    " ctrl d para buscar un fichero en concreto, sin buscar directorios
    " ctrl f cambiamos el modo de busqueda de ctrlP
    " ctrl t abrimos el fichero en una nueva pestaña
    " ctrl v para abrir el fichero con un split vertical
    " ctrl x para abrir el fichero con un split horizontal
    " ctrl z para marcar un fichero.
    
  Plug 'ctrlpvim/ctrlp.vim'
  " Para usar Dash desde vim, prueba de si funciona con neovim
  "Will search for the word under the cursor in the docset corresponding to
  "  the current filetype.
  "  Busca la palabra debajo del cursor: 
  " :Dash -> en el docset del tipo de fichero.
  " :Dash! -> busca en todos los docsets.
  " :DashKeywords -> Muestra la lista de keywords del buffer.
  " :DashKeywords! ruby javascript css -> siguientes opciones de docsets a
  " buscar
  Plug 'rizzatti/dash.vim'

  " airline is a better status line and a tab-bar for nvim.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " Track the engine.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree', {'do': ':NERDTreeToggle'}
  Plug 'neomake/neomake'
  Plug 'tpope/vim-fugitive' 
  call plug#end()
" }
  " Config Plugins {
  "
    " Config NERDTree 
    map <C-n> :NERDTreeToggle<CR>
  "
    " Config Deoplete
    let g:deoplete#enable_at_startup = 1
  "
    " Config ultisinips
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
  " 
    " Config Airline ( powerline  )
    let g:airline#extensions#tabline#enabled = 1
    set laststatus=2
  "
    " Configurar dash:
    " 1-> cuando se realiza una busqueda te abre Dash.
    " 0-> no se abre Dash cuando se realiza una busqueda.(En HUD Mode)
    let g:dash_activate = 0
    nmap <silent> <leader>d <Plug>DashSearch
  "
    " Config Airline-theme
    let g:airline_powerline_fonts = 1
    "let g:solarized_termcolors=256
    let g:gruvbox_italic=1
    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_theme='wombat'
  " 
    " Config scheme color
    set background=dark
    colorscheme gruvbox
    set tabstop=2
    set shiftwidth=2
    set expandtab
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" }
" Mover el cursor entre los diferentes splits de vim
  " Movimiento {
  no <C-k> <C-w>k
  no <C-j> <C-w>j
  no <C-h> <C-w>h
  no <C-l> <C-w>l
  no <Tab> <C-w>w
" }
  " Persistent_undo {
  set undofile
" }
  " Poner el fold para las indentaciones {
  set foldmethod=indent
" }


