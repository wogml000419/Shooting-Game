local physics = require("physics")
local mtIndex = {}

function mtIndex:makeBody()
	physics.addBody(self.resource, "dynamic")
end

function mtIndex:moving( direction, distance )
	self.resource.y = self.resource.y + distance
end

local M = {}

function M.New( group, image, x, y )
	local instance = {
		resource = display.newImage(group, image, x, y)
	}

	return setmetatable(instance, {__index = mtIndex})
end

return M
