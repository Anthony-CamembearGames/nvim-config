return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local custom_gruvbox = require'lualine.themes.everforest'
      local navic = require("nvim-navic")
      -- Change the background of lualine_c section for normal mode
      local function lsp()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return " LSP: "..client.name
          end
        end
        return msg
      end

        require('lualine').setup {
            options = {
              icons_enabled = true,
              theme = custom_gruvbox,
              component_separators = { left = '', right = ''},
              section_separators = { left = '', right = ''},
              disabled_filetypes = {
                statusline = {},
                winbar = {},
              },
              ignore_focus = {},
              always_divide_middle = true,
              always_show_tabline = true,
              globalstatus = false,
              refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
              }
            },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch', 'diff', 'diagnostics'},
              lualine_c = {
                {
                    "navic",
        
                    -- Component specific options
                    color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
                                            -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
                                            -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
                                            --   be enough when the lualine section isn't changing colors based on the mode.
                                            -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
                                            --   the current section.
        
                    navic_opts = nil  -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
                }
            },
              lualine_x = {lsp, 'fileformat', 'filetype'},
              lualine_y = {'progress'},
              lualine_z = {'location'}
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {'filename'},
              lualine_x = {lsp,'location'},
              lualine_y = {},
              lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
          }
    end
}