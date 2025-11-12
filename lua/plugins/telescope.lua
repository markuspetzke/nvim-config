return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    keys = {
      { '<leader>ff', '<CMD>Telescope find_files<CR>', desc = 'Find Files (Project)' },
      {
        '<leader>fc',
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath 'config',
            prompt_title = 'Config Files',
          }
        end,
        desc = 'Find Config Files',
      },
      { '<leader>fr', '<CMD>Telescope oldfiles<CR>', desc = 'Recent Files' },
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
