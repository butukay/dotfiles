--     __             ____        __        __
--    / /_  __  __   / __ )__  __/ /___  __/ /______ ___  __
--   / __ \/ / / /  / __  / / / / __/ / / / //_/ __ `/ / / /
--  / /_/ / /_/ /  / /_/ / /_/ / /_/ /_/ / ,< / /_/ / /_/ /
-- /_.___/\__, /  /_____/\__,_/\__/\__,_/_/|_|\__,_/\__, /
--       /____/                                    /____/
--
-- Github: https://github.com/butukay/dotfiles

require("packer").startup(function(use)
	use { "wbthomason/packer.nvim" }

	-- appearance
	use { 'folke/tokyonight.nvim' }

	use { 'kyazdani42/nvim-web-devicons' }

	-- gui modules
	use { 'romgrk/barbar.nvim' }
	use { 'kyazdani42/nvim-tree.lua' }
	use { 'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end }

	-- helpers
	use { "terrortylor/nvim-comment", config = function() require('nvim_comment').setup() end }  -- comment many lines
    use { "brenoprata10/nvim-highlight-colors", config = function() require('nvim-highlight-colors').setup() end } -- highlight colors
    use { "ntpeters/vim-better-whitespace" } -- strip whitespaces

    -- trouble
	use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons", config = function() require("trouble").setup() end }
	use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = function() require("todo-comments").setup() end }

	-- fuzzy find
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- highlight
	use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update{ with_sync = true }) end }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

	-- completion
	use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' } }

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
	use { 'github/copilot.vim' }

    -- Discord RPC
    use { 'andweeb/presence.nvim', config = function() require('presence').setup() end }
end)

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

vim.o.mouse = a

vim.o.spelllang = "en_us,ru_ru"
vim.o.spell = true

vim.o.foldmethod='marker'
vim.o.foldenable = true
vim.o.foldnestmax = 1

-- keybindings {{{1
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<C-w>k")
vim.keymap.set("n", "<Leader>a", "<C-w>h")
vim.keymap.set("n", "<Leader>s", "<C-w>j")
vim.keymap.set("n", "<Leader>d", "<C-w>l")

local keymap_opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>j", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>k", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", ":bprevious<CR>:bdelete #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>y", ":%y<CR>")

vim.keymap.set("n", "<Leader>v", ":vsplit term://bash <CR>", { silent = true })
vim.keymap.set("n", "<Leader>ts", ":split term://bash <CR>", { silent = true })
vim.keymap.set("n", "<Leader>tv", ":vsplit term://bash <CR>", { silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<F5>", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })

vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<CR>", keymap_opts)
vim.keymap.set('n', '<Leader>f', ":Telescope find_files<CR>", keymap_opts)

vim.keymap.set('n', '<Leader>-', ":split<CR>", keymap_opts)
vim.keymap.set('n', '<Leader>|', ":vsplit<CR>", keymap_opts)

vim.keymap.set('n', '<Space>,', '<Cmd>BufferPrevious<CR>', keymap_opts)
vim.keymap.set('n', '<Space>.', '<Cmd>BufferNext<CR>', keymap_optts)
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

-- }}}1

-- nvim-tree {{{1
require("nvim-tree").setup{
	filters = {
    	dotfiles = false,
    	custom = {".DS_Store", ".git\\>", "__pycache__"},
		exclude = {"[^v]env", "data/*"}
	}
}

-- }}}1

-- lsp configs {{{1
require("mason").setup()

local lsp_flags = {
  debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)

  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require('lspconfig')['pyright'      ].setup{on_attach = on_attach, flags = lsp_flags}
require('lspconfig')['clangd'       ].setup{on_attach = on_attach, flags = lsp_flags}
require('lspconfig')['rust_analyzer'].setup{on_attach = on_attach, flags = lsp_flags}

-- }}}1

-- telescope {{{1
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

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- }}}1

-- treesitter {{{1
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'python', 'rust', 'lua', 'javascript', 'typescript', 'vim', 'help' },

  highlight = { enable = true },
  indent = { enable = true }, -- disable = { 'python' }
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
  },
}

-- }}}1

-- completions {{{1
local cmp = require('cmp')
local luasnip = require('luasnip')

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
      local copilot_keys = vim.fn['copilot#Accept']()

      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
        vim.api.nvim_feedkeys(copilot_keys, 'i', true)
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
    ["<C-j>"] = cmp.mapping(function(fallback)
        cmp.mapping.abort()
        local copilot_keys = vim.fn["copilot#Accept"]()
        if copilot_keys ~= "" then
          vim.api.nvim_feedkeys(copilot_keys, "i", true)
        else
          fallback()
        end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- }}}1

-- copilot {{{1
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- }}}1

