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

local LayerOne, LayerZero, text, boo, candle, candleOne, mario

return {
	enter = function(self, from, songNum, songAppend)
		weeks:enter()

		weekNumber = "i-hate-you"  -- haha just like how the marios madness devs hate me    why do they keep ignoring me 

		--none of this works and it was a huge waste of time

		--i want to delete this port but i have spent too much time on it 


		lavaHappened = {}

		for i = 1, 28 do
			lavaHappened[i] = false
		end
		lavaIsUp = false
		lavaIsUpAgain = false

		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/bg")))
		LayerOne = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/floor"))) -- I HATE THE FLOOR
		text = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/text")))

		boo = love.filesystem.load("sprites/i-hate-you/boo.lua")()
		candle = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		candleOne = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		mario = love.filesystem.load("sprites/i-hate-you/mario.lua")()

		boyfriend = love.filesystem.load("sprites/i-hate-you/boyfriend.lua")()
		girlfriend = love.filesystem.load("sprites/i-hate-you/girlfriend.lua")()
		enemy = love.filesystem.load("sprites/i-hate-you/luigi.lua")()
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		
		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100
		mario.x, mario.y = -500, 50

		enemyIcon:animate("daddy dearest", false)
		boo:animate("anim", true)
		candle:animate("anim", true)
		candleOne:animate("anim", true)
		mario:animate("empty", true)

		self:load()
	end,

	load = function(self)
		weeks:load()


		inst = love.audio.newSource("music/i-hate-you/inst.ogg", "stream")
		voices = love.audio.newSource("music/i-hate-you/voices.ogg", "stream")


		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/i-hate-you/i-hate-you.lua")())

	end,

	update = function(self, dt)
		weeks:update(dt)
		boo:update(dt)
		candle:update(dt)
		candleOne:update(dt)
		mario:update(dt)
		--marioTwo:update(dt)

		if musicTime >= 10000 then
			if mario:getAnimName() == "empty" then
				mario:animate("grab", false)
			--	weeks:safeAnimate(mario, "grab")
			end
			if mario:getAnimName() == "grab" then
				if not mario:isAnimated() then
					mario:animate("idle", true)
				end
			end
		end


	
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

		--lava shit :sin:

		if musicTime > 35714.285 then
			if lava.y == 700 then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "linear")
			end
		end

		if musicTime > 81428.571 then
			if not lavaHappened[1] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[1] = true
			end
		end

		if musicTime > 81785.714 then
			if not lavaHappened[2] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[2] = true
			end
		end

		if musicTime > 82142.857 then
			if not lavaHappened[3] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[3] = true
			end
		end

		if musicTime > 82500 then
			if not lavaHappened[4] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[4] = true
			end
		end

		if musicTime > 82857.142 then
			if not lavaHappened[5] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[5] = true
			end
		end

		if musicTime > 83214.285 then
			if not lavaHappened[6] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[6] = true
			end
		end

		if musicTime > 83571.428 then
			if not lavaHappened[7] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[7] = true
			end
		end

		if musicTime > 83921.571 then
			if not lavaHappened[8] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[8] = true
			end
		end

		if musicTime > 84285.714 then
			if not lavaHappened[9] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[9] = true
			end
		end

		if musicTime > 84642.857 then
			if not lavaHappened[10] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[10] = true
			end
		end

		if musicTime > 85000 then
			if not lavaHappened[11] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[11] = true
			end
		end

		if musicTime > 85357.142 then
			if not lavaHappened[12] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[12] = true
			end
		end

		if musicTime > 85714.285 then
			if not lavaHappened[13] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[13] = true
			end
		end

		if musicTime > 86071.428 then
			if not lavaHappened[14] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[14] = true
			end
		end

		if musicTime > 86428.571 then
			if not lavaHappened[15] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[15] = true
			end
		end

		if musicTime > 86785.714 then
			if not lavaHappened[16] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[16] = true
			end
		end

		if musicTime > 87142.857 then
			if not lavaHappened[17] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[17] = true
			end
		end

		if musicTime > 87500 then
			if not lavaHappened[18] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[18] = true
			end
		end

		if musicTime > 87857.142 then
			if lavaHappened[19] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[19] = true
			end
		end

		if musicTime > 88214.285 then
			if not lavaHappened[20] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[20] = true
			end
		end

		if musicTime > 88571.428 then
			if not lavaHappened[21] then
				Timer.tween(0.1, lava, {x = lava.x, y = 400}, "linear")
				lavaHappened[21] = true
			end
		end

		if musicTime > 88928.571 then
			if not lavaHappened[22] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[22] = true
			end
		end

		if musicTime > 89285 then
			if not lavaHappened[23] then
				Timer.tween(0.1, lava, {x = lava.x, y = 450}, "linear")
				lavaHappened[23] = true
			end
		end

		if musicTime > 89642 then
			if not lavaHappened[24] then
				Timer.tween(0.1, lava, {x = lava.x, y = 300}, "linear")
				lavaHappened[24] = true
			end
		end

	if musicTime > 98571.42 then
		if not lavaHappened[25] then
			Timer.tween(1, lava, {x = lava.x, y = 100}, "linear")
			lavaHappened[25] = true
		end
	end

	if musicTime > 110000 then
		if not lavaHappened[26] then
			Timer.tween(1, lava, {x = lava.x, y = 400}, "linear")
		end
		lavaHappened[26] = true
	end

	if musicTime > 121428.571 then
		if not lavaHappened[27] then
			Timer.tween(2, lava, {x = lava.x, y = 200}, "linear")
			lavaHappened[27] = true
		end
	end

	if musicTime > 127142.857 then
		if not lavaHappened[28] then
			Timer.tween(0.2, lava, {x = lava.x, y = 1000}, "linear")
			lavaHappened[28] = true
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
				boo:draw()
				text:draw()
				candle:draw()
				candleOne:draw()
			--	love.graphics.setColor(0, 0, 0, 0)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				LayerOne:draw()
				for i = -500, 500, 1000 do
					mario.x = i
					mario:draw()
				end
				--marioTwo:draw()

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
		mario = nil
		boo = nil
		text = nil
		candle = nil
		candleOne = nil
		LayerZero = nil
		LayerOne = nil

		weeks:leave()
	end
}

