return {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  event = 'LspAttach',
  opts = {
    text = {
      spinner = 'dots',
    },
    timer = {
      fidget_decay = 0,
      task_decay = 0,
    },
  },
}
