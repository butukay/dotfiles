require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- appearence
	use 'Mofiqul/dracula.nvim'
	use 'projekt0n/github-nvim-theme'
	use 'folke/tokyonight.nvim'

	use "ryanoasis/vim-devicons"
	use 'kyazdani42/nvim-web-devicons'

	-- modules
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
	use 'kyazdani42/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'


	-- helpers
	use "terrortylor/nvim-comment"  -- comment many lines
	use "ntpeters/vim-better-whitespace"

	use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }
	use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }


	--use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	--use 'tpope/vim-sleuth' -- detect tabstop and shiftwidth automatically


	-- fuzzy find
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- highlight
	use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update{ with_sync = true }) end }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

	-- Autocompletion
	use {
    	'hrsh7th/nvim-cmp',
    	requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}

	-- LSP
	use { 'neovim/nvim-lspconfig',
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	}

	-- Github Copilot
	use {'github/copilot.vim'}

    -- Discord RPC
    use 'andweeb/presence.nvim'

    use 'ThePrimeagen/vim-be-good'
end)

require("presence").setup()

vim.cmd[[set spell spelllang=en_us,ru_ru]]

vim.cmd[[colorscheme tokyonight-moon]]
vim.o.termguicolors = true

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.scrolloff = 4
vim.o.updatetime = 100

vim.o.splitbelow = true
vim.o.splitright = true

vim.cmd[[set mouse="a"]]
vim.cmd[[tnoremap <Esc> <C-\><C-n>]]

-- folding
vim.o.foldmethod='expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'
vim.o.foldenable = false
vim.o.foldnestmax = 1

vim.o.foldmethod='marker'

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<C-w>k")
vim.keymap.set("n", "<Leader>a", "<C-w>h")
vim.keymap.set("n", "<Leader>s", "<C-w>j")
vim.keymap.set("n", "<Leader>d", "<C-w>l")

local keymap_opts = { noremap = true, silent = true }
--
-- vim.keymap.set("n", "<Up>", ":!echo bebra<CR>", keymap_opts)
-- vim.keymap.set("n", "<Down>", ":!echo bebra<CR>", keymap_opts)
-- vim.keymap.set("n", "<Right>", ":!echo bebra<CR>", keymap_opts)
-- vim.keymap.set("n", "<Left>", ":!echo bebra<CR>", keymap_opts)

vim.keymap.set("n", "<Leader>j", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>k", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", ":bprevious<CR>:bdelete #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>y", ":%y<CR>")

vim.keymap.set("n", "<Leader>v", ":vsplit term://bash <CR>", { silent = true })
vim.keymap.set("n", "<Leader>b", "<C-\\><C-n>", { silent = true })

vim.keymap.set("n", "<F7>", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })

vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<CR>", keymap_opts)
vim.keymap.set('n', '<Leader>f', ":Telescope find_files<CR>", keymap_opts)

vim.keymap.set('n', '<Leader>-', ":split<CR>", keymap_opts)
vim.keymap.set('n', '<Leader>|', ":vsplit<CR>", keymap_opts)


vim.keymap.set('n', '<Space>,', '<Cmd>BufferPrevious<CR>', keymap_opts)
vim.keymap.set('n', '<Space>.', '<Cmd>BufferNext<CR>', keymap_opts)
vim.keymap.set('n', '<Space><', '<Cmd>BufferMovePrevious<CR>', keymap_opts)
vim.keymap.set('n', '<Space>>', '<Cmd>BufferMoveNext<CR>', keymap_opts)
vim.keymap.set('n', '<Space>1', '<Cmd>BufferGoto 1<CR>', keymap_opts)
vim.keymap.set('n', '<Space>2', '<Cmd>BufferGoto 2<CR>', keymap_opts)
vim.keymap.set('n', '<Space>3', '<Cmd>BufferGoto 3<CR>', keymap_opts)
vim.keymap.set('n', '<Space>4', '<Cmd>BufferGoto 4<CR>', keymap_opts)
vim.keymap.set('n', '<Space>5', '<Cmd>BufferGoto 5<CR>', keymap_opts)
vim.keymap.set('n', '<Space>6', '<Cmd>BufferGoto 6<CR>', keymap_opts)
vim.keymap.set('n', '<Space>7', '<Cmd>BufferGoto 7<CR>', keymap_opts)
vim.keymap.set('n', '<Space>8', '<Cmd>BufferGoto 8<CR>', keymap_opts)
vim.keymap.set('n', '<Space>9', '<Cmd>BufferGoto 9<CR>', keymap_opts)
vim.keymap.set('n', '<Space>0', '<Cmd>BufferLast<CR>', keymap_opts)
vim.keymap.set('n', '<Space>p', '<Cmd>BufferPin<CR>', keymap_opts)
vim.keymap.set('n', '<Space>c', '<Cmd>BufferClose<CR>', keymap_opts)
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', keymap_opts)
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', keymap_opts)
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', keymap_opts)
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', keymaps_opts)

require('lualine').setup()
require("nvim-tree").setup{
	filters = {
    	dotfiles = false,
    	custom = {".DS_Store", ".git\\>", "__pycache__"},
		exclude = {"[^v]env", "data/*"}
	}
}

require('nvim_comment').setup()

require("trouble").setup()
require("todo-comments").setup()

require("mason").setup()

local lsp_flags = {
  debounce_text_changes = 150,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

require('lspconfig')['clangd'].setup{
    on_attach = on_attach
}

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
	file_ignore_patterns = { 'node_modules', '__pycache__', 'venv'},
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
      follow = true
    }
  },
}

pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim', 'javascript' },

  highlight = { enable = true },
  indent = { enable = true }, --, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>a'] = '@parameter.inner',
    --   },
    --   swap_previous = {
    --     ['<leader>A'] = '@parameter.inner',
    --   },
    -- },
  },
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

