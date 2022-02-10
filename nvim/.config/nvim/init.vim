syntax on
" .rafi syntax highlighting
au BufNewFile,BufRead /*.rasi setf css

set scrolloff=8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=n-v-c:block
" set nohlsearch
set hls
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

" don't change working directory when browsing in netrw
let g:netrw_keepdir = 1
" change default copy command to allow recursive copying
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_localmkdir = 'mkdir -p'

" Vue `-` symbol doesn't break highlighting
" set iskeyword+=-

" -------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Autocomplete and LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Undotree
Plug 'mbbill/undotree'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " update the parsers on update
Plug 'nvim-treesitter/playground'

Plug 'mi544/harpoonish.nvim'
Plug 'mi544/vim-ripgrep'

Plug 'easymotion/vim-easymotion'

" Vue
" Plug 'posva/vim-vue'

call plug#end()
" -------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " turn on case-insencitive feature

set termguicolors
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

set completeopt=menuone,noselect

lua << EOF
require("harpoon").setup({
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    excluded_filetypes = { "harpoon" }
  },
})
EOF

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

local phpcsfixer = {
  formatCommand = ">/dev/null 2>&1 tee $(mkdir -p /tmp/php-cs-fixer/; echo '/tmp/php-cs-fixer/1.php') && >/dev/null 2>&1 PHP_CS_FIXER_FUTURE_MODE=1 php-cs-fixer fix --using-cache=no --rules=@PSR12 /tmp/php-cs-fixer/1.php && cat /tmp/php-cs-fixer/1.php && rm /tmp/php-cs-fixer/1.php",
  formatStdin = true,
}

local remark = {
  formatCommand = "remark --rc-path $HOME/.config/remark/.remarkrc.yml --no-color --no-config",
  formatStdin = true,
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

require'lspconfig'.efm.setup{
  root_dir = require'lspconfig'.util.root_pattern(
    ".git",
    ".md",
    ".markdown",
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.js",
    ".prettierrc",
    ".prettierrc.js",
    ".prettierrc.json"
    ),
  on_attach = function(client)
    client.resolved_capabilities.goto_definition = false
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = {
    ".git",
    ".md",
    ".markdown",
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.js",
    ".prettierrc",
    ".prettierrc.js",
    ".prettierrc.json",
    },
    languages = {
      markdown = { remark },
      javascript = { eslint },
      typescript = { eslint },
      vue = { eslint },
      php = { phpcsfixer },
      json = { prettier },
      html = { prettier },
    }
  },
  filetypes = {
    "markdown",
    "javascript",
    "typescript",
    "vue",
    "php",
    "json",
    "html",
  },
}

-- require'lspconfig'.clangd.setup{}

require'lspconfig'.bashls.setup{}

-- require'lspconfig'.gopls.setup{
--   root_dir = require'lspconfig'.util.root_pattern("go.mod", ".git"),
--   cmd = {"gopls", "serve"}
-- }

require'lspconfig'.phpactor.setup{}

require'lspconfig'.pylsp.setup{}

require'lspconfig'.rls.setup{
  root_dir = require'lspconfig'.util.root_pattern("Cargo.toml", "rust-project.json")
}

require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
}

require'lspconfig'.vuels.setup{
  root_dir = require'lspconfig'.util.root_pattern(".git", ".eslintrc.js", ".prettierrc"),
  init_options = {
    config = {
      vetur = {
        completion = {
          tagCasing = "pascal",
          useScaffoldSnippets = true, 
        },
        format = {
          defaultFormatter = {
            html = "none",
            css = "none", 
            js = "none",
            sass = "none",
          },
          options = {
            useTabs = false,
          },
          experimental = {
            templateInterpolationService = true,
          },
          dev = {
            logLevel = "DEBUG",
          },
        }
      }
    }
  }
}
EOF


lua << EOF
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    'javascript',
    'vue',
    'lua',
    'json',
    'html',
    'scss',
    'php',
  }
}
EOF
let mapleader = " "

" ~~~~~~~~~~~~~~~~~~~~~~
" UTILITIES
" ~~~~~~~~~~~~~~~~~~~~~~
" C-c acts like esc
inoremap <C-c> <esc>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>n :noh<CR>

" Project Navigation
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

" Quickfix List
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprev<CR>zzzv

"
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" ~~~~~~~~~~~~~~~~~~~~~~
" COPYING-PASTING
" ~~~~~~~~~~~~~~~~~~~~~~
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" expected behavior for Y
nnoremap Y y$
" expected behavior for )
nnoremap ) d0i
nnoremap ( d0
nnoremap & d$
nnoremap <leader>Y "+y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist records relative moves (jk)
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving lines of text in all modes
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==<insert>
inoremap <C-k> <esc>:m .-2<CR>==<insert>

" ~~~~~~~~~~~~~~~~~~~~~~
" LSP
" ~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>ff :lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vc :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
"what is it?
"nnoremap <leader>vll :call LspLocationList()<CR>

nnoremap <leader>ld :lua vim.lsp.diagnostic.set_loclist()<CR>
inoremap <silent><expr> <C-CR> compe#confirm('<CR>')

" ~~~~~~~~~~~~~~~~~~~~~~
" GIT FUGITIVE
" ~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>gs :G<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gp :Git push origin 
nnoremap <leader>gph :Git push origin HEAD<CR>
nnoremap <leader>gpp :Git pull<CR>
nnoremap <leader>gppb :Git pull origin 
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gcc :Git checkout 
nnoremap <leader>gccb :Git checkout -b 

" ~~~~~~~~~~~~~~~~~~~~~~
" HARPOON
" ~~~~~~~~~~~~~~~~~~~~~~
nnoremap <silent> <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>dr :lua require("harpoon.mark").clear_all()<CR>

nnoremap <silent> <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <leader>dh :lua require("harpoon.mark").add_file(nil, 1)<CR>
nnoremap <silent> <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <leader>dt :lua require("harpoon.mark").add_file(nil, 2)<CR>
nnoremap <silent> <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <leader>dn :lua require("harpoon.mark").add_file(nil, 3)<CR>
nnoremap <silent> <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent> <leader>ds :lua require("harpoon.mark").add_file(nil, 4)<CR>

" ~~~~~~~~~~~~~~~~~~~~~~
" PROJECT SPECIFIC REMAPS
" ~~~~~~~~~~~~~~~~~~~~~~
" yarn testing
nnoremap <leader>cdp :cd ~/projects/remax/peak<CR>
nnoremap <leader>tt :! yarn test:unit %:p<CR>
nnoremap <leader>tu :! yarn test:unit -u %:p<CR>


" EasyMotion
map mm <Plug>(easymotion-bd-w)
map ml <Plug>(easymotion-bd-jk)
