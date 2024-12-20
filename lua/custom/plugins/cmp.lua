return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = {
      char = '┊'
      }
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
