local M = {}

function M.escape(text)
	if not text then
		return "''"
	end
	return "'" .. string.gsub(tostring(text), "'", "'\\''") .. "'"
end

function M.trim(text)
	if not text then
		return ""
	end
	return (text:gsub("^%s+", ""):gsub("%s+$", ""))
end

return M
