local mtIndex = {}

local M = {}

function M.New()
	local instance = {}

	return setmetatable(instance, {__index = mtIndex})
end

return M