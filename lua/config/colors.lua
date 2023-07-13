require('rose-pine').setup {
  disable_background = true,
}

vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme rose-pine ]]

function ColorMyNvim(color)
  local hi = vim.api.nvim_set_hl
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  local hlNormal = vim.api.nvim_get_hl_by_name('BufferCurrent', true)
  local hlVisual = vim.api.nvim_get_hl_by_name('Visual', true)

  hi(0, 'Normal', { bg = 'none' })
  hi(0, 'NormalFloat', { bg = 'none' })
  hi(0, 'MiniStatuslineModeNormal', { bg = 'none', fg = vim.g.terminal_color_8, bold = true })
  hi(0, 'MiniStatuslineModeInsert', { bg = 'none', fg = vim.g.terminal_color_3, bold = true })
  hi(0, 'MiniStatuslineModeVisual', { bg = 'none', fg = vim.g.terminal_color_2, bold = true })
  hi(0, 'MiniStatuslineModeOther', { bg = 'none', fg = vim.g.terminal_color_1, bold = true})
  hi(0, 'MiniStatuslineModeReplace', { bg = 'none', fg = hlVisual.bg, bold = true })
  hi(0, 'MiniStatuslineModeCommand', { bg = 'none', fg = hlVisual.bg, bold = true })
  hi(0, 'MiniStatuslineDevinfo', { bg = 'none' })
  hi(0, 'MiniStatuslineFilename', { bg = hlNormal.bg })
  hi(0, 'MiniStatuslineFileinfo', { bg = 'none' })
  hi(0, 'MiniStatuslineInactive', { bg = 'none' })
end

ColorMyNvim()
