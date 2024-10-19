local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = 'path\\to\\netcoredbg\\netcoredbg.exe',
  args = { '--interpreter=vscode' },
}

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'Launch - netcoredbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
