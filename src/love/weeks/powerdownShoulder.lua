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
		shoulderWeeks:enter()

		weekNumber = "powerdown"

		blackScreen = false

		lightning = love.audio.newSource("sounds/week2/thunder1.ogg", "static")

		fading = 0
		fadingTwo = 1
		fadingThree = 0
		fadingFour = 1
		wahooFade = 1
		fadingRed = 1

		red = false


		song = songNum
		difficulty = songAppend

		bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/bg")))
		ground = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/ground")))
		luigi = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/luigi")))
		wahoo = graphics.newImage(love.graphics.newImage(graphics.imagePath("powerdown/wahoo")))
		girlfriend = love.filesystem.load("sprites/powerdown/girlfriend.lua")()
		boyfriend = love.filesystem.load("sprites/powerdown/boyfriend.lua")()
		bush = love.filesystem.load("sprites/powerdown/bush.lua")()
		cloud = love.filesystem.load("sprites/powerdown/cloud.lua")()

		cam.sizeX, cam.sizeY = 0.8, 0.8
		camScale.sizeX, camScale.sizeY = 0.8, 0.8

		marioTalk = love.filesystem.load("sprites/powerdown/marioTalk.lua")()
		marioTalkTwo = love.filesystem.load("sprites/powerdown/marioTalk.lua")()  -- there is a good reason for two of these

		marioTalk.x, marioTalk.y = 160, 0
		marioTalkTwo.x, marioTalkTwo.y = marioTalk.x, marioTalk.y

		marioTalk:setAnimSpeed(12)
		marioTalkTwo:setAnimSpeed(12)

		enemy = love.filesystem.load("sprites/powerdown/mario.lua")()
		enemyTwo = enemy
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -410, -110
		boyfriend.x, boyfriend.y = 280, 100

		cloud.x, cloud.y = -500, -500
		luigi.x, luigi.y = 515, 80 

		wahoo.sizeY, wahoo.sizeX = 0, 0
		wahoo.y = -75


		--size
		boyfriend.sizeX, boyfriend.sizeY = 0.9, 0.9
		enemy.sizeX, enemy.sizeY = 0.8, 0.8
		girlfriend.sizeX, girlfriend.sizeY = 0.9, 0.9
		luigi.sizeX, luigi.sizeY = 0.7, 0.7
		bush.sizeX, bush.sizeY = 0.7, 0.7
		cloud.sizeY, cloud.sizeX = 0.7, 0.7

		enemyIcon:animate("powerdown", false)
		marioTalk:animate("anim", true)
		marioTalkTwo:animate("anim", true)
		cloud:animate("anim", true)
		bush:animate("anim", true)

		function marioJump()
			--enemy:animate("right", false)
			Timer.tween(0.3, enemy, {y = enemy.y - 100}, "out-expo", function()
				enemy:animate("down", false)
				Timer.tween(0.2, enemy, {y = enemy.y + 100}, "in-expo", function()
				end)
			end)
		end



		self:load()
	end,

	load = function(self)
		shoulderWeeks:load()

		inst = love.audio.newSource("music/powerdown/inst.ogg", "stream")
		voices = love.audio.newSource("music/powerdown/voices.ogg", "stream")

		self:initUI()

		shoulderWeeks:setupCountdown()
	end,

	initUI = function(self)
		shoulderWeeks:initUI()

		shoulderWeeks:generateNotes(love.filesystem.load("charts/powerdown/powerdown.lua")())

	end,

	update = function(self, dt)
		shoulderWeeks:update(dt)
		marioTalk:update(dt)
		marioTalkTwo:update(dt)
		bush:update(dt)
		cloud:update(dt)

		
		delta = love.timer.getDelta()
	
		if health >= 80 then
			if enemyIcon:getAnimName() == "powerdown" then
				enemyIcon:animate("powerdown losing", false)
			end
		else
			if enemyIcon:getAnimName() == "powerdown losing" then
				enemyIcon:animate("powerdown", false)
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
						Gamestate.switch(songsMenu)

						status.setLoading(false)
					end
				)
			end
		end

		if musicTime >= 21502 then
			if musicTime <= 21552 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 34682 then
			if musicTime <= 34732 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 37456 then
			if musicTime <= 37506 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 44393 then
			if musicTime <= 44443 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 45780 then
			if musicTime <= 45830 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 49942 then
			if musicTime <= 49992 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 51329 then
			if musicTime <= 51379 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 76994 then
			if musicTime <= 77044 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 83930 then
			if musicTime <= 83980 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 88092 then
			if musicTime <= 88142 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 101965 then
			if musicTime <= 10115 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 107514 then
			if musicTime <= 107564 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 

		if musicTime >= 101965 then
			if musicTime <= 102015 then
				shoulderWeeks:bladeAttack()
				marioJump()
			end
		end 


		shoulderWeeks:updateUI(dt)
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
				luigi:draw()
				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)



				love.graphics.setColor(1, 1, 1, wahooFade)
				wahoo:draw()
				love.graphics.setColor(1, 1, 1, 1)

				if musicTime > 118612 and musicTime < 122080 then

					if musicTime >= 3750 then
						graphics.setColor(0, 0, 0, fading)
						if fading < 1 then fading = fading + 0.95 * delta end
		
						love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					end
				end


				if musicTime > 122070 then
					graphics.setColor(0, 0, 0, fadingTwo)
					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if musicTime > 123988 then
						if fadingTwo > 0 then fadingTwo = fadingTwo - 0.9999 * delta end
					end
				end


				if musicTime > 124161 and wahoo.sizeY == 0 then
					Timer.tween(1.1, wahoo, {orientation = wahoo.orientation - 0.5, sizeX = 1, sizeY = 1, y = wahoo.y - 620}, "out-quad")
				end 

				--124161





				if musicTime > 119739 and musicTime < 121387 then

					graphics.setColor(1, 1, 1, fading)
					if fadingThree < 1 then fadingThree = fadingThree + 0.95 * delta end

					marioTalk:draw()
				end


				if musicTime > 121380 then
					graphics.setColor(1, 1, 1, fadingFour)
					if not red then
						marioTalkTwo:draw()
					end
					if musicTime > 123988 then
						if fadingFour > 0 then fadingFour = fadingFour - 0.9999 * delta end
					end
				end

				if musicTime > 124160 then
					graphics.setColor(1, 0, 0, fadingRed)
					if fadingRed > 0 then fadingRed = fadingRed - 0.99999 * delta end
	
					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					red = true
				end

				if musicTime > 124161 then
					if wahooFade > 0 then wahooFade = wahooFade - 0.6 * delta end
				end



			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			shoulderWeeks:drawRating(0.9)
		love.graphics.pop()

		shoulderWeeks:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		curtains = nil

		shoulderWeeks:leave()
	end
}
