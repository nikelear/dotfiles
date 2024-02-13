let s:jetpackdir = $XDG_DATA_HOME .. '/vim'
let s:jetpackfile = s:jetpackdir .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

execute 'source' s:jetpackfile

call jetpack#begin(s:jetpackdir)
Jetpack 'Tani/vim-jetpack'
Jetpack 'sainnhe/sonokai'
Jetpack 'itchyny/lightline.vim'
Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'vlime/vlime', { 'rtp': 'vim' }
Jetpack 'tpope/vim-fireplace', { 'for': 'clojure' }
Jetpack 'easymotion/vim-easymotion'
Jetpack 'tpope/vim-surround'
Jetpack 'tpope/vim-commentary'
Jetpack 'sheerun/vim-polyglot'
Jetpack 'airblade/vim-gitgutter'
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

syntax on
set number
set relativenumber
set signcolumn=yes
set laststatus=2
colorscheme sonokai
let g:lightline = {'colorscheme' : 'sonokai'}
set mouse=a
" set list
" set listset listchars=space:⋅,tab:»-,trail:-,nbsp:%,eol:↲
set list
set listchars=space:⋅,tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%