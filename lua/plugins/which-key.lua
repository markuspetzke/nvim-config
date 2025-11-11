return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern', -- oder "classic", "helix"
    delay = 0, -- Zeit in ms bevor which-key erscheint
    icons = {
      breadcrumb = '»', -- Symbol für verschachtelte Gruppen
      separator = '➜', -- Symbol zwischen Key und Beschreibung
      group = '+', -- Symbol für Gruppen
    },
    win = {
      border = 'rounded', -- "none", "single", "double", "rounded", "solid", "shadow"
      padding = { 1, 2 }, -- Extra Fenster-Padding [top/bottom, right/left]
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    -- Registriere deine Keybindings mit Beschreibungen
    wk.add {
      -- Leader-basierte Mappings
      { '<leader>f', group = 'Find (Telescope)' },
      { '<leader>ff', desc = 'Find Files' },
      { '<leader>fg', desc = 'Live Grep' },
      { '<leader>fb', desc = 'Find Buffers' },
      { '<leader>fh', desc = 'Help Tags' },
      { '<leader>fa', desc = 'Aerial' },
      { '<leader>fp', desc = 'Projects' },

      { '<leader>l', group = 'LSP/Code' },
      { '<leader>lr', desc = 'Rename' },
      { '<leader>la', desc = 'Code Action' },
      { '<leader>lf', desc = 'Format' },
      { '<leader>ld', desc = 'Diagnostics' },

      { '<leader>g', group = 'Git' },
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },

      { '<leader>s', group = 'Search' },
      { '<leader>ss', desc = 'Search String' },
      { '<leader>sw', desc = 'Search Word' },
      { '<leader>sr', desc = 'Search & Replace' },

      { '<leader>w', group = 'Window', proxy = '<c-w>' },
      { '<leader>q', group = 'Quit/Session' },
      { '<leader>x', group = 'Diagnostics/Quickfix' },

      -- Normale Mode Mappings
      { 'g', group = 'Goto' },
      { 'gd', desc = 'Goto Definition' },
      { 'gr', desc = 'Goto References' },
      { 'gi', desc = 'Goto Implementation' },
      { 'gt', desc = 'Goto Type Definition' },

      { 'gs', group = 'Surround' },
      { 'z', group = 'Fold' },

      { '[', group = 'Previous' },
      { '[b', desc = 'Previous Buffer' },
      { '[d', desc = 'Previous Diagnostic' },

      { ']', group = 'Next' },
      { ']b', desc = 'Next Buffer' },
      { ']d', desc = 'Next Diagnostic' },

      -- Visual Mode
      { mode = 'v', '<leader>', group = 'Leader' },
      { mode = 'v', '<leader>g', group = 'Git' },
      { mode = 'v', '<leader>l', group = 'LSP' },
    }
  end,
}
