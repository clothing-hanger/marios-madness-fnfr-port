local backFunc

--load font
local font = love.graphics.newFont("fonts/fnfFont.ttf", 24) -- not used yet but probably will be              this is CH Engine's last project and its still unused lmao

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")


local credits = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/credits")))

return {
	enter = function(self, previous)
		songNum = 0

		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(songsMenu)				
			end
		end
	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			credits:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}
