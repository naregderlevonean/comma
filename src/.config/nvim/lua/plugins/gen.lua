local model = "qwen2.5-coder:7b"

local system_prompt = [[
You are a senior software engineer.
Write concise, correct, idiomatic and maintainable code.
Prefer modern language features and avoid unnecessary complexity.
]]

local commands = {
	explain = {
		prompt = "Explain this code clearly and in detail:",
	},
	refactor = {
		prompt = "Refactor this code for readability, maintainability and performance without changing behavior:",
	},
	fix = {
		prompt = "Find and fix bugs, errors and potential issues in this code:",
	},
	test = {
		prompt = "Write comprehensive unit tests for this code:",
	},
}

return {
	"David-Kunz/gen.nvim",
	cmd = "Gen",
	keys = {
		{ "<leader>ai", "<cmd>Gen<cr>", desc = "AI Generate" },
		{ "<leader>ae", "<cmd>Gen explain<cr>", desc = "Explain Code" },
		{ "<leader>ar", "<cmd>Gen refactor<cr>", desc = "Refactor Code" },
		{ "<leader>af", "<cmd>Gen fix<cr>", desc = "Fix Issues" },
	},
	opts = {
		model = model,
		temperature = 0.2,
		max_tokens = 2048,
		system_prompt = system_prompt,
		quit_map = "q",
		display_mode = "float",
		show_model = true,
		no_auto_close = true,
		commands = commands,
		output = function(response)
			vim.api.nvim_put(vim.split(response, "\n"), "", true, true)
		end,
		init = function()
			if vim.fn.executable("ollama") == 0 then
				return
			end

			vim.system({ "ollama", "list" }, { text = true }, function(result)
				if result.code ~= 0 then
					return
				end

				local stdout = result.stdout or ""

				for line in stdout:gmatch("[^\r\n]+") do
					local name = line:match("^(%S+)")
					if name == model then
						return
					end
				end

				vim.schedule(function()
					vim.notify(
						("Model '%s' not found. Pull it with: ollama pull %s"):format(model, model),
						vim.log.levels.WARN
					)
				end)
			end)
		end,
	},
}
