vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ Lazy ]
require 'config.lazy'

-- Load default configurations and plugins
for _, source in ipairs {
  'options',
  'keymaps',
  'autocmds',
} do
  local ok, fault = pcall(require, source)
  if not ok then
    vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault)
  end
end

-- [ Bufferline ]
require('bufferline').setup()
