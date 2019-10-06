let automation=$AUTOMATION

call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim'
Plug 'OmniSharp/omnisharp-vim'
echo "yes"

" Initialize plugin system
call plug#end()

" Required for some plugins to work properly
filetype plugin on
filetype plugin indent on

let g:Omnisharp_want_snippet=0
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_use_mono = 1

let g:deoplete#ignore_case = 1 
let g:echodoc_enable_at_startup = 1
let g:echodoc#enable_force_overwrite =1
set cmdheight=3

let g:deoplete#enable_at_startup =1
if automation != '1'
  call deoplete#custom#option('sources', {
  			\ 'cs': ['omnisharp'],
  			\})
endif
let g:deoplete#is_silent=1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#ignore_case = 1
let g:deoplete#auto_complete_start_length = 0

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

if automation != '1'
  call deoplete#custom#option('auto_complete_delay',600)
  call deoplete#custom#source('omnisharp', 'max_abbr_width', 0)
  call deoplete#custom#source('omnisharp', 'max_menu_width', 0)
endif
autocmd FileType cs call deoplete#custom#option('auto_complete_delay',0)
autocmd FileType gd call deoplete#custom#option('auto_complete_delay',0)

let g:OmniSharp_typeLookupInPreview=1

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

let g:ctrlp_prompt_mappings = {
			\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
			\ 'AcceptSelection("t")': ['<cr>'],
			\ }
