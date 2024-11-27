-- Telescope configs
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<C-Space>', builtin.find_files, { desc = 'Telescope find files' })

-- autopairs configs for use with nvim cmp
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

  -- BELOW CONTAINS LSP AND AUTOCOMPLETE CONFIGURATIONS ----------------
  ----------------------------------------------------------------------

  -- Enable Metals scala lsp - requires installation of scala + coursier
  -- require'lspconfig'.metals.setup{}

  -- Enable docker lsp
  -- Needs `npm install -g dockerfile-language-server-nodejs`
  require'lspconfig'.dockerls.setup{}

  -- Enable json lsp
  -- Needs `npm i -g vscode-langservers-extracted`
  require'lspconfig'.jsonls.setup{}

  -- Enable python lsp
  require'lspconfig'.pyright.setup{}
  -- Needs to install multiple pip packages to use pylsp
  -- require'lspconfig'.pylsp.setup{
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         black = {
  --           enabled = true,
  --         },
  --         pylsp_mypy = {
  --           live_mode = true
  --         },
  --         isort = {
  --           enabled = true,
  --         },
  --         rope_autoimport = {
  --           enabled = true
  --         }
  --       }
  --     }
  --   }
  -- }

  -- Enable gopls LSP
  require'lspconfig'.gopls.setup{}

  -- runs goimports
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      -- buf_request_sync defaults to a 1000ms timeout. Depending on your
      -- machine and codebase, you may want longer. Add an additional
      -- argument after params if you find that you have to write the file
      -- twice for changes to be saved.
      -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({async = false})
    end
  })

  -- Format on save using Black for python files
  vim.api.nvim_create_autocmd("bufWritePost", {
	group = vim.api.nvim_create_augroup("Black", { clear = true }),
	pattern = "*.py",
	command = "silent !black %",
  })

  -- Google: Modern Format On Save. Language agnostic. Leverages built in LSP
  -- vim.api.nvim_create_autocmd("LspAttach", {
  --   group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  --   callback = function(args)
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       buffer = args.buf,
  --       callback = function()
  --         vim.lsp.buf.format {
  --           async = false,
  --           id = args.data.client_id,
  --           filter = function(client) return client.name ~= "jsonls" end
  --         }
  --       end,
  --     })
  --   end
  -- })

  -- set rename refactor to shortcut
  vim.api.nvim_set_keymap('n', "rf", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = false })

  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require'luasnip'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
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
      -- Use TAB/S-TAB to scroll through completion items.
	  ["<TAB>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
		  	cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
		  	luasnip.expand_or_jump()
		  else
		  	fallback()
		  end
	  end, {"i", "s"}),

	  ["<S-TAB>"] = cmp.mapping(function(fallback)
	  	if cmp.visible() then
	  		cmp.select_prev_item()
	  	elseif luasnip.jumpable(-1) then
	  		luasnip.jump(-1)
	  	else
	  		fallback()
	  	end
	  end, {"i", "s"}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

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
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig autocomplete.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  -- capabilities = capabilities
  -- }
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['jsonls'].setup {
      capabilities = capabilities
  }
  require('lspconfig')['dockerls'].setup {
      capabilities = capabilities
  }

-- Startify configs
vim.g.session_autosave = 'yes'
vim.g.session_autoload = 'yes'
vim.g.session_default_to_last = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1

-- NERDTree configs
vim.g.NERDTreeShowHidden = 1
-- Start NERDTree if nvim started with no args, call startify, then NERDTree, then move cursor to window
vim.cmd[[ autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif ]]
-- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
vim.cmd[[ autocmd StdinReadPre * let s:std_in=1 ]]
vim.cmd[[ autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | wincmd p | endif ]]
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd[[ autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif ]]


