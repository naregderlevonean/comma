return {
	"David-Kunz/gen.nvim",
	cmd = { "Gen" },
	keys = {
		{ "<leader>ai", "<cmd>Gen<cr>", desc = "AI Generate" },
		{ "<leader>ae", "<cmd>Gen explain<cr>", desc = "Explain Code" },
		{ "<leader>ar", "<cmd>Gen refactor<cr>", desc = "Refactor Code" },
		{ "<leader>af", "<cmd>Gen fix<cr>", desc = "Fix Issues" },
	},
	opts = {
		model = "qwen2.5-coder:7b",
		temperature = 0.2,
		top_p = 0.9,
		max_tokens = 2048,
		system_prompt = "You are a senior software engineer. Provide concise, accurate, and well-structured responses.",
		quit_map = "q",
		display_mode = "float",
		show_model = true,
		no_auto_close = true,
		commands = {
			explain = { prompt = "Explain the following code in detail:" },
			refactor = { prompt = "Refactor this code to improve readability and performance:" },
			fix = { prompt = "Identify and fix any bugs or issues in this code:" },
			test = { prompt = "Write unit tests for this code:" },
		},
		output = function(response)
			vim.api.nvim_put({ response }, "", { after = true, pos = "end" })
		end,
		init = function()
			vim.system({ "ollama", "list" }, { text = true }, function(out)
				if not out.stdout:match("qwen2%.5%-coder:7b") then
					vim.notify(
						"Model 'qwen2.5-coder:7b' not found. Pull with: ollama pull qwen2.5-coder:7b",
						vim.log.levels.WARN
					)
				end
			end)
		end,
	},
}
