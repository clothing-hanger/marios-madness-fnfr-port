return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("powerdown/pow")),
	-- Made by Guglio :(
    {
        {x = 0, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Now 0000
        {x = 0, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Now 0001
        {x = 20, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Now 0002
        {x = 20, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Now 0003
        {x = 40, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Now 0004
        {x = 40, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Now 0005
        {x = 60, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Now 0006
		{x = 60, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Now 0007
        {x = 80, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Now 0008
        {x = 80, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: Now 0009
        {x = 60, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: Now 0010
        {x = 60, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Now 0011
        {x = 30, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Now 0012
        {x = 30, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Now 0013
        {x = 20, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Now 0014
        {x = 20, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Now 0015
        {x = 0, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: Now 0016
        {x = 0, y = 0, width = 20, height = 20, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 18: Now 0017
    },
	{
		["now"] = {start = 1, stop = 18, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 1, stop = 2, speed = 24, offsetX = 0, offsetY = 0}
	},
	"now",
	false
)
