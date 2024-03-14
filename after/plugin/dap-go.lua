-- Debugging
vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

--require('dap-config')
require('nvim-dap-virtual-text').setup()
require('dapui').setup()

local dap, dapui = require("dap"), require("dapui")

dap.adapters.go = {
  type = 'server',
  host = '127.0.0.1',
  port = 45000 -- Adjust this to the port your Delve server is listening on
}

-- Configure DAP to use the custom adapter for Go debugging sessions
dap.configurations.go = {
  {
    -- Name of the configuration, can be anything
    name = "Debug Event Container",
    -- Type must match the adapter name
    type = "go",
    -- Request type can be "launch" or "attach", here we "attach" to an existing Delve server
    request = "attach",
    mode = "remote",
    -- The port and host where the Delve server is running
    port = 45000, -- Ensure this matches the Delve server's port
    host = "127.0.0.1",
    -- "program" specifies the directory of the program being debugged; adjust as needed
    -- For attach mode, this might not be necessary, or you might point it to the local source directory for source mapping
    showLog= true,
    trace= "log",
    logOutput= "rpc"
  }
}


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
