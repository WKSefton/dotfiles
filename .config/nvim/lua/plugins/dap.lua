return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		cmd = { "DapToggleBreakpoint", "DapContinue" }, -- Load on DAP commands
		dependencies = {
			"rcarriga/nvim-dap-ui", -- UI for nvim-dap
			"theHamsta/nvim-dap-virtual-text", -- Virtual text for nvim-dap
			"nvim-neotest/nvim-nio",
		},

		config = function()
			local dap = require("dap")

			dap.adapters.coreclr = {
				type = "executable",
				command = "C:\\netcoredbg\\netcoredbg",
				-- "C:\\Users\\WilliamSe\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg",
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "Launch - NetCoreDbg",
					request = "launch",
					--env = "ASPNETCORE_ENVIRONMENT=Development",
					env = {
						ASPNETCORE_HOSTINGSTARTUPASSEMBLIES = "Microsoft.AspNetCore.SpaProxy",
						ASPNETCORE_ENVIRONMENT = "Development",
					},
					cwd = vim.fn.getcwd(),
					console = "integratedConsole",
					args = {
						"--urls",
						"https://localhost:7205;http://localhost:5107",
					},
					program = function()
						--vim.g.dotnet_build_project()
						--return vim.g.dotnet_get_dll_path()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
			}
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true }) -- Start or continue debugging
			vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true, silent = true }) -- Step over
			vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true, silent = true }) -- Step into
			vim.keymap.set("n", "<F12>", dap.step_out, { noremap = true, silent = true }) -- Step out
			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { noremap = true, silent = true }) -- Toggle breakpoint
			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { noremap = true, silent = true }) -- Set conditional breakpoint
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, { noremap = true, silent = true }) -- Open REPL
			vim.keymap.set("n", "<Leader>dl", dap.run_last, { noremap = true, silent = true }) -- Run last configuration
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		after = "nvim-dap",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
