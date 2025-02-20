-- greeter
return {
  'goolord/alpha-nvim',
  branch = 'main',
  config = function()
      local dashboard = require 'alpha.themes.dashboard'

      local header = {
        content = {
          '████        ',
          '   █       ',
          '    █      ',
          '    ██     ',
          '   ██    ',
          '  █  █   ',
          ' █    ████',
      },

        hl = 'NvpunkRed',
    }

      dashboard.section.header.val = header.content
      dashboard.section.header.opts.hl = header.hl

      local function button(sc, txt, cmd, hl)
          local b = dashboard.button(sc, txt, cmd)
          b.opts.hl = hl or 'Title'
          b.opts.hl_shortcut = 'Comment'
          return b
      end

      dashboard.section.buttons.val = {            button(
        'nf',
        ''..'  New file',
        ':NvpunkNewFileDialog<CR>'
    ),
    button(
        'ß',
        ''..'  Open explorer',
        ':Neotree reveal<CR>'
    ),
    button(
      's.',
      '󰋚'..'  Recent files',
      ':lua require"telescope.builtin".oldfiles()<CR>'
    ),
    button(
      'sf',
      '󰍉'..'  Find file',
      ':lua require"lua.custom.internals.telescope_pickers".find_files()<CR>'
  ),
  button(
      'sg',
      '󰱽'..'  Find word',
      ':lua require"lua.custom.internals.telescope_pickers".live_grep()<CR>'
  ),



}


      local function get_neovim_version()
          local v = vim.version()
          return 'v'
              .. tostring(v.major)
              .. '.'
              .. tostring(v.minor)
              .. '.'
              .. tostring(v.patch)
      end

      dashboard.section.footer.val = ""
          .. ' Neovim '
          .. get_neovim_version()
      dashboard.section.footer.opts.hl = 'Comment'

      dashboard.config.layout = {
          { type = 'padding', val = 3 },
          dashboard.section.header,
          { type = 'padding', val = 2 },
          dashboard.section.buttons,
          { type = 'padding', val = 2 },
          dashboard.section.footer,
      }

      dashboard.section.buttons.opts.spacing = 0
      dashboard.config.opts.keymap = {
          press = { '<CR>', '<2-LeftMouse>' },
      }
      require('alpha').setup(dashboard.config)

  end,
}
