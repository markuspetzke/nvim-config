return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Smooth Animationen
    animate = {
      enabled = true,
      duration = 20, -- ms pro Frame
      easing = 'linear',
      fps = 60,
    },

    -- Große Dateien optimieren
    bigfile = {
      enabled = true,
      notify = true, -- Benachrichtigung wenn bigfile erkannt wird
      size = 1.5 * 1024 * 1024, -- 1.5MB
      -- Welche Features bei großen Dateien deaktiviert werden:
      setup = function(ctx)
        vim.cmd [[NoMatchParen]] -- Keine Klammer-Highlights
        vim.b.minianimate_disable = true
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ctx.ft
        end)
      end,
    },

    -- Dashboard deaktiviert (du nutzt ja dashboard-nvim)
    dashboard = { enabled = false },

    -- Snacks Explorer (File Manager)
    explorer = {
      enabled = true,
      win = {
        position = 'left',
        width = 35,
        border = 'rounded',
      },
      -- Filter für versteckte Dateien
      filters = {
        hidden = false, -- Zeige hidden files
        custom = { '^%.git$', '^node_modules$', '^%.DS_Store$' },
      },
      -- Icons
      icons = {
        folder_closed = '',
        folder_open = '',
        file = '',
        symlink = '',
      },
      -- Formatierung
      format = {
        filename = {
          width = 0, -- 0 = no limit
          hl = 'Normal',
        },
        indent = {
          size = 2,
          hl = 'Comment',
        },
      },
    },

    -- Indent Guides (du hast blink.indent, also aus)
    indent = { enabled = false },

    -- Bessere Input-Prompts
    input = {
      enabled = true,
      icon = ' ',
      icon_hl = 'SnacksInputIcon',
      win = {
        border = 'rounded',
      },
    },

    -- Picker (Telescope ist besser, also aus)
    picker = { enabled = false },

    -- Notifier (du hast nvim-notify)
    notifier = {
      enabled = true,
      timeout = 3000, -- 3 Sekunden
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { 'level', 'added' },
      level = vim.log.levels.TRACE,
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
        debug = ' ',
        trace = ' ',
      },
      style = 'compact', -- "compact" oder "fancy" oder "minimal"
    },

    -- Schnelleres Laden von Dateien
    quickfile = { enabled = true },

    -- Scope Highlights (zeigt aktuellen Scope)
    scope = {
      enabled = true,
      -- Cursor muss mindestens so lange auf Position sein
      cursor = {
        enabled = true,
        min_size = 2,
      },
      treesitter = {
        enabled = true,
        blocks = {
          'function_declaration',
          'function_definition',
          'method_declaration',
          'method_definition',
          'class_declaration',
          'class_definition',
          'do_statement',
          'while_statement',
          'for_statement',
          'if_statement',
        },
      },
    },

    -- Smooth Scrolling
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 250 },
        easing = 'outQuad',
      },
      spamming = 10, -- Scrolling-Events innerhalb 10ms werden gruppiert
      -- Animiere diese Scroll-Befehle:
      filter = function(buf, event)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype ~= 'terminal' and not vim.wo.diff
      end,
    },

    -- Statuscolumn (Zeilen-Nummern, Signs, Folds)
    statuscolumn = {
      enabled = true,
      left = { 'mark', 'sign' }, -- Links: Marks & Signs (Git, Diagnostics)
      right = { 'fold', 'git' }, -- Rechts: Fold & Git
      folds = {
        open = true, -- Zeige open fold icons
        git_hl = true, -- Färbe Zeilen nach Git-Status
      },
      git = {
        patterns = { 'GitSign', 'MiniDiffSign' },
      },
      refresh = 50, -- Refresh-Rate in ms
    },

    -- Word highlighting (wie vim-illuminate)
    words = {
      enabled = true,
      debounce = 100, -- ms Verzögerung
      notify_jump = false, -- Keine Notification beim Springen
      notify_end = false, -- Keine Notification am Ende
      foldopen = true, -- Öffne Folds wenn Wort darin
      jumplist = true, -- Füge zu Jumplist hinzu
      modes = { 'n' }, -- Nur in Normal Mode
    },

    -- Zen Mode (optional, sehr nützlich!)
    zen = {
      enabled = false, -- Aktiviere wenn du willst
      toggles = {
        dim = true,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = false,
        inlay_hints = false,
      },
      zoom = {
        width = 0.85, -- 85% Bildschirmbreite
        height = 0.9, -- 90% Bildschirmhöhe
      },
      win = {
        backdrop = 0.95,
      },
      show = {
        statusline = false,
        tabline = false,
      },
    },

    -- Styles für verschiedene Windows
    styles = {
      notification = {
        wo = { wrap = true },
        border = 'rounded',
      },
      input = {
        border = 'rounded',
      },
    },
  },

  keys = {
    -- Explorer
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'Explorer (Root Dir)',
    },
    {
      '<leader>E',
      function()
        Snacks.explorer { cwd = vim.fn.expand '%:p:h' }
      end,
      desc = 'Explorer (Current File)',
    },

    -- Notifier
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>nh',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },

    -- Git Browse (öffnet Datei/Zeile in GitHub/GitLab)
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log',
    },

    -- Rename (besseres Rename als vim.lsp.buf.rename)
    {
      '<leader>lr',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },

    -- Words (Wort-Highlights)
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },

    -- Scratch Buffer (temporärer Buffer)
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },

    -- Zen Mode (wenn aktiviert)
    -- { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  },

  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Snacks Shortcuts
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        -- Toggle features
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
