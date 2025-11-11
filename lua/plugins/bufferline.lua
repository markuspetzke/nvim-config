return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  opts = {
    options = {
      -- Style
      mode = 'buffers', -- "tabs" oder "buffers"
      themable = true,

      -- Zahlen anzeigen
      numbers = 'none', -- "none" | "ordinal" | "buffer_id" | "both"

      -- Close Button
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,

      -- Icons
      indicator = {
        icon = '▎',
        style = 'icon', -- 'icon' | 'underline' | 'none'
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',

      -- Diagnostics
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,

      -- Offsets (für File Explorer links)
      offsets = {
        {
          filetype = 'snacks_explorer',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
      },

      -- Farbe basierend auf Buffer-Sichtbarkeit
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,

      -- Separator Style
      separator_style = 'thin', -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }

      -- Immer Tab-Leiste anzeigen
      always_show_bufferline = true,

      -- Hover-Effekte
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },

      -- Sortierung
      sort_by = 'insert_after_current', -- 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'

      -- Groups (Tab-Gruppen)
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
        items = {
          {
            name = 'Tests',
            highlight = { underline = true, sp = 'blue' },
            priority = 2,
            icon = '',
            matcher = function(buf)
              return buf.name:match '%_test' or buf.name:match '%_spec'
            end,
          },
          {
            name = 'Docs',
            highlight = { underline = true, sp = 'green' },
            auto_close = false,
            matcher = function(buf)
              return buf.name:match '%.md' or buf.name:match '%.txt'
            end,
          },
        },
      },
    },

    -- Highlights anpassen (optional)
    highlights = {
      fill = {
        bg = '#1e1e2e', -- Hintergrund der gesamten Leiste
      },
      background = {
        fg = '#6c7086',
        bg = '#1e1e2e',
      },
      buffer_selected = {
        fg = '#cdd6f4',
        bg = '#313244',
        bold = true,
        italic = false,
      },
      buffer_visible = {
        fg = '#a6adc8',
        bg = '#1e1e2e',
      },
      close_button = {
        fg = '#6c7086',
        bg = '#1e1e2e',
      },
      close_button_selected = {
        fg = '#f38ba8',
        bg = '#313244',
      },
      modified = {
        fg = '#f9e2af',
        bg = '#1e1e2e',
      },
      modified_selected = {
        fg = '#f9e2af',
        bg = '#313244',
      },
      separator = {
        fg = '#1e1e2e',
        bg = '#1e1e2e',
      },
      indicator_selected = {
        fg = '#89b4fa',
        bg = '#313244',
      },
      pick = {
        fg = '#f38ba8',
        bg = '#1e1e2e',
        bold = true,
      },
      pick_selected = {
        fg = '#f38ba8',
        bg = '#313244',
        bold = true,
      },
    },
  },

  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Fix bufferline wenn neovim mit Argumenten gestartet wird
    vim.api.nvim_create_autocmd('BufAdd', {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
