--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

local fromState

return {
	enter = function(self, from)

		image = graphics.newImage(love.graphics.newImage(graphics.imagePath("apparition/wariodeath")))

		fromState = from

		if inst then inst:stop() end
		voices:stop()
		inst = love.audio.newSource("sounds/apparition/gameOver.ogg", "stream")
		inst:play()
		Timer.clear()

		image.x, image.y = -100, 165

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("confirm") then
				if inst then inst:stop() end -- In case inst is nil and "confirm" is pressed before game over music starts

				inst = love.audio.newSource("sounds/apparition/gameOverEnd.ogg", "stream")
				inst:play()

				Timer.clear()

				graphics.fadeOut(
					3,
					function()
						Gamestate.pop()

						fromState:load()
					end
				)
			elseif input:pressed("gameBack") then
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.pop()

						inst = nil

						Gamestate.switch(songsMenu)

						status.setLoading(false)

					end
				)
			end
		end

		boyfriend:update(dt)
	end,

	draw = function(self)

		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				love.graphics.translate(cam.x, cam.y)

				image:draw()



				
			love.graphics.pop()
		love.graphics.pop()
	end
}
