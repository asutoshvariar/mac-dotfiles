call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'gregsexton/MatchTag'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'tpope/vim-fugitive' 
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'willthbill/opener.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

source ~/.config/nvim/lualine.vim

set mouse=a

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

set guifont=MesloLGM\ Nerd\ Font\ Mono:h18

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovimneovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#14191e", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
  augroup END
endif

colorscheme onedark
syntax on
set number
highlight Normal ctermbg=None
highlight LineNr ctermbg=DarkGrey

lua <<EOF
require('telescope').load_extension("opener")

local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
  }
}

require'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "/Users/avimac/.local/omnisharp/run", "--languageserver" , "--hostPID", tostring(pid) },
  
}
EOF
