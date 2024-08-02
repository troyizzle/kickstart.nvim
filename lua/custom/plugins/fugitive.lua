vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

local Config_Fugitive = vim.api.nvim_create_augroup('Config_Fugitive', {})

local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWinEnter', {
  group = Config_Fugitive,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= 'fugitive' then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>p', function()
      vim.cmd.Git 'push'
    end, opts)
  end,
})

return {
  {
    'tpope/vim-fugitive',
  },
}
