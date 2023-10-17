return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'rose-pine',
      sections = {
        lualine_c = { 'filename', path = 2 },
        lualine_x = { 'tabnine' },
      },
    }
  }
}
