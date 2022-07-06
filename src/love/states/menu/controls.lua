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



return {
	enter = function(self, previous)

		shoulderButtons = "Dodge"

		faceButtons = "Arrows"

		shoulderDodge = true


		joycons = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/joycons")))

		static = love.filesystem.load("sprites/menu/static.lua")()

		static.sizeX, static.sizeY = 1.2, 1.2

		static:animate("anim", true)

		changingMenu = false

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9


		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,



	update = function(self, dt)
		static:update(dt)

		if shoulderDodge then
			shoulderButtons = "Dodge"
			faceButtons = "Arrows"
		else
			shoulderButtons = "Arrows"
			faceButtons = "Dodge"
		end


		if not graphics.isFading() then
			if input:pressed("confirm") then
				audio.playSound(confirmSound)
				Timer.after(0.6, 
					function()
						graphics.fadeOut(
							0.3,
							function()
								if shoulderDodge then
									Gamestate.switch(songPowerdownFaceDodge)
								else
									Gamestate.switch(songPowerdownShoulderDodge)
								end
								status.setLoading(false)
							end
						)
					end
				)	
			elseif input:pressed("left") then
				if shoulderDodge then
					shoulderDodge = false
				else
					shoulderDodge = true
				end
			elseif input:pressed("right") then
				if shoulderDodge then
					shoulderDodge = false
				else
					shoulderDodge = true
				end
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				love.graphics.setColor(1, 1, 1)
				joycons:draw()
				love.graphics.setFont(marioFont)

				love.graphics.printf("Use the D-Pad to select a control scheme", -640, 285, 853, "center", nil, 2, 2)
				love.graphics.printf(shoulderButtons, -470, -359, 853, "center", nil, 1.5, 1.5)
				love.graphics.printf(shoulderButtons, -470, -312, 853, "center", nil, 1.5, 1.5)
				love.graphics.printf(faceButtons, -470, -180, 853, "center", nil, 1.5, 1.5)
				love.graphics.printf(faceButtons, -470, -45, 853, "center", nil, 1.5, 1.5)
				love.graphics.setColor(1, 1, 1, 0.8)
				static:draw()

				love.graphics.setColor(1, 1, 1)
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		Timer.clear()
	end
}
