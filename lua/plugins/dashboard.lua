return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {
      theme = 'doom', -- 'doom' oder 'hyper'
      config = {
        header = {
          '',
          '',
          '',
          '',
          '',
          '',
          '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
          '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
          '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
          '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
          '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
          '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
          '',
          '',
        },
        center = {
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            key_format = ' %s', -- Zeigt [f] an
            action = 'Telescope find_files',
          },
          {
            icon = '  ',
            desc = 'Recent Files        ',
            key = 'r',
            key_format = ' %s',
            action = 'Telescope oldfiles',
          },
          {
            icon = '  ',
            desc = 'Find Word           ',
            key = 'g',
            key_format = ' %s',
            action = 'Telescope live_grep',
          },
          {
            icon = '  ',
            desc = 'Projects            ',
            key = 'p',
            key_format = ' %s',
            action = 'Telescope projects',
          },
          {
            icon = '  ',
            desc = 'New File            ',
            key = 'n',
            key_format = ' %s',
            action = 'enew',
          },
          {
            icon = '  ',
            desc = 'Configuration       ',
            key = 'c',
            key_format = ' %s',
            action = function()
              require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath 'config',
                prompt_title = 'Neovim Config',
              }
            end,
          },
          {
            icon = '  ',
            desc = 'Lazy (Plugins)      ',
            key = 'u',
            key_format = ' %s',
            action = 'Lazy',
          },
          {
            icon = '  ',
            desc = 'Quit                ',
            key = 'q',
            key_format = ' %s',
            action = 'quit',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            '',
            '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms',
          }
        end,
      },
      hide = {
        statusline = true,
        bufferline = true,
        winbar = true,
      },
    }
  end,
}
