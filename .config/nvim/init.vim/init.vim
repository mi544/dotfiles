syntax on

set scrolloff=8
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set guicursor=n-v-c:block
set nohlsearch
set hidden
set number
set relativenumber
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set noshowmode

" More space for displaying messages
set cmdheight=2

" Performance improvement
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" -------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Autocomplete and LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Themes
" Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Prettier
" Plug 'sbdchd/neoformat'

" Vue
" Plug 'posva/vim-vue'

call plug#end()
" -------------------------------

set termguicolors
colorscheme gruvbox

set completeopt=menuone,noselect

lua << EOF
require'compe'.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
})
EOF


lua << EOF
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

require'lspconfig'.efm.setup{
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = { eslint },
	  vue = { eslint },
    }
  },
  filetypes = {
    "javascript",
    "vue",
  },
}

require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
}

require'lspconfig'.vuels.setup{}
EOF

let mapleader = " "

" Utils
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Navigation
nnoremap <leader>pv :Vex<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>


nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Copying-pasting
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Line manipulation
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" LSP
nnoremap <leader>ff :lua vim.lsp.buf.formatting_sync(nil, 2500)<CR>

" Git Fugitive
nmap <leader>gs  :G<CR>
nmap <leader>gd :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gb :Git branch<CR>
nmap <leader>gp :lua vim.api.nvim_command("Git push origin " .. vim.fn.input("Push branch > "))<CR>
nmap <leader>gph :Git push origin HEAD<CR>
nmap <leader>gpp :lua vim.api.nvim_command("Git pull origin " .. vim.fn.input("Pull branch > "))<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gcc :lua vim.api.nvim_command("Git checkout " .. vim.fn.input("Branch to checkout > "))<CR>
nmap <leader>gccb :lua vim.api.nvim_command("Git checkout -b " .. vim.fn.input("Branch to checkout (-b) > "))<CR>

