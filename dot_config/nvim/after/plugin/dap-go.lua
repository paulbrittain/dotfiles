
--require('dap-config')
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('dap-go').setup()

local dap, dapui = require("dap"), require("dapui")

-- Debugging
vim.keymap.set("n", "<F1>", dap.step_into, { desc = 'Debug: Step Into'})
vim.keymap.set("n", "<F2>", dap.step_over, { desc = 'Debug: Step Over'})
vim.keymap.set("n", "<F3>", dap.step_out, { desc = 'Debug: Step Out'})
vim.keymap.set("n", "<F4>", dap.continue, { desc = 'Debug: Start/Continue'})
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint'})
vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
