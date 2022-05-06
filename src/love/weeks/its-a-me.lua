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

local song, difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		weeks:enter()

		weekNumber = "its-a-me"

		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("its-a-me/Brick3")))
		LayerOne= graphics.newImage(love.graphics.newImage(graphics.imagePath("its-a-me/Brick4")))
		LayerTwo = graphics.newImage(love.graphics.newImage(graphics.imagePath("its-a-me/Brick5")))
		LayerThree = graphics.newImage(love.graphics.newImage(graphics.imagePath("its-a-me/BricksBG2")))
		Ground = graphics.newImage(love.graphics.newImage(graphics.imagePath("its-a-me/BricksBG1")))

		LayerTwo.y = 50

		LayerZero.sizeX, LayerZero.sizeY = 1.1, 1.1
		LayerOne.sizeX, LayerOne.sizeY = 1.1, 1.1
		LayerTwo.sizeX, LayerTwo.sizeY = 1.1, 1.1
		LayerThree.sizeX, LayerThree.sizeY = 1.1, 1.1
		Ground.sizeX, Ground.sizeY = 1.1, 1.1


		enemy = love.filesystem.load("sprites/its-a-me/mario.lua")()
		enemyTwo = love.filesystem.load("sprites/its-a-me/mario.lua")()
		girlfriend = love.filesystem.load("sprites/its-a-me/girlfriend.lua")()
		boyfriend = love.filesystem.load("sprites/its-a-me/boyfriend.lua")()
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/its-a-me/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		
		girlfriend.x, girlfriend.y = -40, -20
		enemy.x, enemy.y = -340, 20
		boyfriend.x, boyfriend.y = 260, 210

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()

		inst = love.audio.newSource("music/its-a-me/inst.ogg", "stream")
		voices = love.audio.newSource("music/its-a-me/voices.ogg", "stream")
		

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/its-a-me/its-a-me.lua")())

	end,

	update = function(self, dt)
		weeks:update(dt)


		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			if storyMode and song < 1 then
				song = song + 1

				self:load()
			else
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
				
				LayerZero:draw()
				LayerOne:draw()
				LayerTwo:draw()
				LayerThree:draw()
				Ground:draw()

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				Ground:draw()
				girlfriend:draw()
				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		curtains = nil

		weeks:leave()
	end
}
