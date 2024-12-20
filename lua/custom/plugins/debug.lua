return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    dapui.setup()

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F8>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F5>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F6>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F7>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F1>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
  end,
}

-- vim: ts=2 sts=2 sw=2 et
