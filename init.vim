call plug#begin()
 " Plugin section
 "Plug 'dracula/vim'
 "Plug 'ryanoasis/vim-devicons'
 "Plug 'SirVer/ultisnips'
 "Plug 'honza/vim-snippets'
 "Plug 'scrooloose/nerdtree'
 "Plug 'preservim/nerdcommenter'
 "Plug 'mhinz/vim-startify'
 "Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'
 Plug 'folke/tokyonight.nvim'
 Plug 'nvim-tree/nvim-web-devicons' " optional
 Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :NvimTreeToggle<CR>

colorscheme tokyonight-storm

lua <<EOF
  -- disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  -- vim.opt.termguicolors = true
  
  -- OR setup with some options
  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  })



  -- open the tree...but fuck, it always focuses
  -- require("nvim-tree.api").tree.toggle({focus = false, update_root = true, })
  -- local win = vim.api.nvim_get_current_win()
  -- local buf = vim.api.nvim_create_buf(true, true)
  -- vim.api.nvim_set_current_win(win)
  -- vim.api.nvim_win_set_buf(win, buf)

  -- vim.api.nvim_command("wincmd l")
  -- vim.cmd("wincmd l")
  -- vim.schedule(function() vim.cmd("wincmd l") end )
  -- vim.api.nvim_create_autocmd("VimEnter", { command = "TmuxNavigateRight" })


  -- auto close
  local function is_modified_buffer_open(buffers)
      for _, v in pairs(buffers) do
          if v.name:match("NvimTree_") == nil then
              return true
          end
      end
      return false
  end
  
  vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
          if
              #vim.api.nvim_list_wins() == 1
              and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
              and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
          then
              vim.cmd("quit")
          end
      end,
  })

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }

EOF

