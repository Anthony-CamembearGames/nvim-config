return {
  'akinsho/toggleterm.nvim',
  tag = '*',
  config = function()
    require('toggleterm').setup {

      open_mapping = [[<c-T>]],
      hide_numbers = true,
      direction = 'float',
      auto_scroll = true,
      float_opts = {
        border = 'curved',
      },
    }
  end,
}
