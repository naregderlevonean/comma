local ok, err = pcall(vim.cmd.colorscheme, "van")

if not ok then
	vim.notify("Colorscheme error: " .. err, vim.log.levels.WARN)
end

for module in pairs(package.loaded) do
	if module:match("^schemes%.van") then
		package.loaded[module] = nil
	end
end

vim.cmd.colorscheme("van")
