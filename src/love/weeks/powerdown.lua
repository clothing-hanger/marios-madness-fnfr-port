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

		weekNumber = "one"

		song = songNum
		difficulty = songAppend

		bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/bg")))
		ground = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/ground")))
		luigi = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/luigi")))
		girlfriend = love.filesystem.load("sprites/its-a-me/girlfriend.lua")()
		boyfriend = love.filesystem.load("sprites/i-hate-you/boyfriend.lua")()
		bush = love.filesystem.load("sprites/powerdown/bush.lua")()
		cloud = love.filesystem.load("sprites/powerdown/cloud.lua")()


		enemy = love.filesystem.load("sprites/powerdown/mario.lua")()
		enemyTwo = enemy
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		
		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()

		inst = love.audio.newSource("music/powerdown/inst.ogg", "stream")
		voices = love.audio.newSource("music/powerdown/voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/powerdown/powerdown.lua")())

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
			if storyMode and song < 3 then
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

		if musicTime >= 21502 then
			if musicTime <= 21552 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 34682 then
			if musicTime <= 34732 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 37456 then
			if musicTime <= 37506 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 44393 then
			if musicTime <= 44443 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 45780 then
			if musicTime <= 45830 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 49942 then
			if musicTime <= 49992 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 51329 then
			if musicTime <= 51379 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 76994 then
			if musicTime <= 77044 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 83930 then
			if musicTime <= 83980 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 88092 then
			if musicTime <= 88142 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 101965 then
			if musicTime <= 10115 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 107514 then
			if musicTime <= 107564 then
				weeks:bladeAttack()
			end
		end 

		if musicTime >= 101965 then
			if musicTime <= 102015 then
				weeks:bladeAttack()
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

				bg:draw()
				cloud:draw()
				bush:draw()
				ground:draw()

				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

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
