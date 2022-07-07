local backFunc

--load font
local font = love.graphics.newFont("fonts/fnfFont.ttf", 24) -- not used yet but probably will be              this is CH Engine's last project and its still unused lmao

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")



-- I really wanted to finished this song but it just kept breaking :(



return {
	enter = function(self, previous)
		songNum = 0
	end,

	update = function(self, dt)
		if input:pressed("confirm") then
			songNum = 1
			status.setLoading(true)
			graphics.fadeOut(
				0.5,
				function()
					Gamestate.switch(songRacetraitors)

					status.setLoading(false)
				end
			)
		end

		if input:pressed("back") then
			Gamestate.switch(menuCredits)
		end


	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.printf("PLEASE NOTE: Race Traitors is very unfinished because I literally gave up on it lmfao", -600, 0, 853, "center", nil, 1.5, 1.5)
			love.graphics.printf("If you still want to play it, press Enter or A, if you don't want to play it, press idfk whatever button goes back", -500, 100, 853, "center", nil, 1, 1)


			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}
