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

local upFunc, downFunc, confirmFunc, backFunc, drawFunc, musicStop

local menuState

local menuNum = 1

local songNum, songAppend
local songDifficulty = 2

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

music = love.audio.newSource("music/menu/menu.ogg", "stream")

local function switchMenu(titleScreen)
	function backFunc()
		graphics.fadeOut(0.5, love.event.quit)
	end

	menuState = 1
end

music:setLooping(true)

return {
	enter = function(self, previous)

		text = graphics.newImage(love.graphics.newImage(graphics.imagePath("titleScreen/text")))
		logo = graphics.newImage(love.graphics.newImage(graphics.imagePath("titleScreen/logo")))
		mario = graphics.newImage(love.graphics.newImage(graphics.imagePath("titleScreen/mario")))

		pressEnter = love.filesystem.load("sprites/titleScreen/enter.lua")()
		characters = love.filesystem.load("sprites/titleScreen/characters.lua")()

		--pressEnter:animate("anim", true)
		characters:animate("anim", true)

		logo.sizeX, logo.sizeY = 0.55, 0.55
		pressEnter.sizeX, pressEnter.sizeY = 1.1, 1.1
		text.sizeX, text.sizeY = 0.9, 0.9
		pressEnter.y = 280
		logo.y = -110
		mario.y = -150
		characters.y = 250
		text.x, text.y = -500, 350    

		static = love.filesystem.load("sprites/menu/static.lua")()

		static.sizeX, static.sizeY = 1.2, 1.2

		static:animate("anim", true)

		characters:setAnimSpeed(12)

		menuBPM = 25
		changingMenu = false

		songNum = 0

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)


		music:play()

		function tweenMario()
			Timer.tween(2.5, mario, {y = mario.y + 25}, "in-out-quad", function()
				Timer.tween(2.5, mario, {y = mario.y - 25}, "in-out-quad", function()
					tweenMario()
				end)
			end)
		end

		tweenMario()

	end,

	musicStop = function(self)
		music:stop()
	end,

	musicVolumeLower = function(self)
		music:setVolume(0.4)
	end,

	update = function(self, dt)
		pressEnter:update(dt)
		characters:update(dt)
		static:update(dt)

		if not graphics.isFading() then
			if input:pressed("confirm") then
				audio.playSound(confirmSound)

				pressEnter:animate("anim", true)
				Timer.after(0.6, 
					function()
						graphics.fadeOut(
							0.3,
							function()
								Gamestate.switch(songsMenu)
								status.setLoading(false)
							end
						)
					end
				)	
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				backFunc()
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				characters:draw()
				mario:draw()
				logo:draw()
				pressEnter:draw()


				love.graphics.setColor(1, 1, 1, 0.3)
				static:draw()
				love.graphics.setColor(1, 1, 1)
				text:draw()
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		Timer.clear()
	end
}
