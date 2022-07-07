return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("racetraitors/item")),
	-- Automatically generated from cajamk.xml
	{
		{x = 0, y = 0, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 1: cajamk nada0000
		{x = 110, y = 0, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 2: cajamk shell0000
		{x = 220, y = 0, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 3: cajamk bomb0000
		{x = 0, y = 110, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 4: cajamk ghost0000
		{x = 110, y = 110, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 5: cajamk random0000
		{x = 220, y = 110, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 6: cajamk random0001
		{x = 0, y = 220, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 7: cajamk random0002
		{x = 110, y = 220, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110}, -- 8: cajamk random0003
		{x = 220, y = 220, width = 110, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 110, offsetHeight = 110} -- 9: cajamk random0004
	},
	{
		["random"] = {start = 5, stop = 9, speed = 24, offsetX = 0, offsetY = 0},
		["empty"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
		["shell"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
		["ghost"] = {start = 4, stop = 4, speed = 24, offsetX = 0, offsetY = 0}
	},
	"random",
	false
)
