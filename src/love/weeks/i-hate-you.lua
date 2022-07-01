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

		for i = 1, 53 do
			lavaHappened[i] = false
		end
		lavaIsUp = false
		lavaIsUpAgain = false
		lavaNum = 0
		IHYTextHasHappened = false

		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/bg")))
		LayerOne = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/floor"))) -- I HATE THE FLOOR
		text = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/text")))

		boo = love.filesystem.load("sprites/i-hate-you/boo.lua")()
		booOne = love.filesystem.load("sprites/i-hate-you/boo.lua")()
		booTwo = love.filesystem.load("sprites/i-hate-you/boo.lua")()
		candle = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		candleOne = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		mario = love.filesystem.load("sprites/i-hate-you/mario.lua")()
		marioTwo = love.filesystem.load("sprites/i-hate-you/mario.lua")()

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
		marioTwo.x, marioTwo.y = 500, 50
		text.x, text.y = 525, -125

		boo.x, boo.y = -490, -75
		booOne.x, booOne.y = 250, -25
		booTwo.x, booTwo.y = 270, -70

		boo.sizeX = -1

		booOne.sizeY = -1

		enemyIcon:animate("daddy dearest", false)
		boo:animate("anim", true)
		booOne:animate("anim", true)
		booTwo:animate("anim", true)
		candle:animate("anim", true)
		candleOne:animate("anim", true)
		mario:animate("empty", true)
		marioTwo:animate("empty", true)

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
		marioTwo:update(dt)

		if musicTime >= 112857 then
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

		if musicTime >= 115714 then
			if marioTwo:getAnimName() == "empty" then
				marioTwo:animate("grab", false)
			end
			if marioTwo:getAnimName() == "grab" then
				if not marioTwo:isAnimated() then
					marioTwo:animate("idle", true)
				end
			end
		end

		if musicTime > 98035 then
			if not IHYTextHasHappened then
				Timer.tween(0.2, text, {sizeX = 0.95, sizeY = 0.95}, "out-expo")
				IHYTextHasHappened = true
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
				Timer.tween(0.2, lava, {x = lava.x, y = 550}, "out-quad")
				lavaNum = lavaNum + 1
			end
		end

		if musicTime > 81428.571 then
			if not lavaHappened[1] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[1] = true
			end
		end

		if musicTime > 81785.714 then
			if not lavaHappened[2] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[2] = true
			end
		end

		if musicTime > 82142.857 then
			if not lavaHappened[3] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[3] = true
			end
		end

		if musicTime > 82500 then
			if not lavaHappened[4] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[4] = true
			end
		end

		if musicTime > 82857.142 then
			if not lavaHappened[5] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[5] = true
			end
		end

		if musicTime > 83214.285 then
			if not lavaHappened[6] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[6] = true
			end
		end

		if musicTime > 83571.428 then
			if not lavaHappened[7] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[7] = true
			end
		end

		if musicTime > 83921.571 then
			if not lavaHappened[8] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[8] = true
			end
		end

		if musicTime > 84285.714 then
			if not lavaHappened[9] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[9] = true
			end
		end

		if musicTime > 84642.857 then
			if not lavaHappened[10] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[10] = true
			end
		end

		if musicTime > 85000 then
			if not lavaHappened[11] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[11] = true
			end
		end

		if musicTime > 85357.142 then
			if not lavaHappened[12] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[12] = true
			end
		end

		if musicTime > 85714.285 then
			if not lavaHappened[13] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[13] = true
			end
		end

		if musicTime > 86071.428 then
			if not lavaHappened[14] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[14] = true
			end
		end

		if musicTime > 86428.571 then
			if not lavaHappened[15] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[15] = true
			end
		end

		if musicTime > 86785.714 then
			if not lavaHappened[16] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[16] = true
			end
		end

		if musicTime > 87142.857 then
			if not lavaHappened[17] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[17] = true
			end
		end

		if musicTime > 87500 then
			if not lavaHappened[18] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[18] = true
			end
		end

		if musicTime > 87857.142 then
			if lavaHappened[19] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[19] = true
			end
		end

		if musicTime > 88214.285 then
			if not lavaHappened[20] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[20] = true
			end
		end



		--wtf

		if musicTime > 88571.428 then
			if not lavaHappened[21] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[21] = true
			end
		end

		--that one seems delayed


		
		if musicTime > 88928.571 then
			if not lavaHappened[22] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[22] = true
			end
		end

		if musicTime > 89285 then
			if not lavaHappened[23] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[23] = true
			end
		end

		if musicTime > 89642 then
			if not lavaHappened[24] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[24] = true
			end
		end

		-- new ones start here


		if musicTime > 90000 then
			if not lavaHappened[25] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[25] = true
			end
		end

		if musicTime > 90357 then
			if not lavaHappened[26] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[26] = true
			end
		end

		if musicTime > 90714 then
			if not lavaHappened[27] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[27] = true
			end
		end

		if musicTime > 91071 then
			if not lavaHappened[28] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[28] = true
			end
		end

		if musicTime > 91428 then
			if not lavaHappened[29] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[29] = true
			end
		end

		if musicTime > 91785 then
			if not lavaHappened[30] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[30] = true
			end
		end

		if musicTime > 92142 then
			if not lavaHappened[31] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[31] = true
			end
		end

		if musicTime > 92500 then
			if not lavaHappened[32] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[32] = true
			end
		end

		if musicTime > 92857 then
			if not lavaHappened[33] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[33] = true
			end
		end

		if musicTime > 93214 then
			if not lavaHappened[34] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[34] = true
			end
		end

		if musicTime > 93571 then
			if not lavaHappened[35] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[35] = true
			end
		end

		if musicTime > 93928 then
			if not lavaHappened[36] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[36] = true
			end
		end

		if musicTime > 94285 then
			if not lavaHappened[37] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[37] = true
			end
		end

		if musicTime > 94642 then
			if not lavaHappened[38] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[38] = true
			end
		end

		if musicTime > 95000 then
			if not lavaHappened[39] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[39] = true
			end
		end

		if musicTime > 95357 then
			if not lavaHappened[40] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[40] = true
			end
		end

		if musicTime > 95714 then
			if not lavaHappened[41] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[41] = true
			end
		end

		if musicTime > 96071 then
			if not lavaHappened[42] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[42] = true
			end
		end

		if musicTime > 96428 then
			if not lavaHappened[43] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[43] = true
			end
		end

		if musicTime > 96785 then
			if not lavaHappened[44] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[44] = true
			end
		end

		if musicTime > 97142 then
			if not lavaHappened[45] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[45] = true
			end
		end

		if musicTime > 97500 then
			if not lavaHappened[46] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[46] = true
			end
		end

		if musicTime > 97857 then
			if not lavaHappened[47] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[47] = true
			end
		end

		if musicTime > 98035 then
			if not lavaHappened[48] then
				Timer.tween(0.2, lava, {x = lava.x, y = 600}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[48] = true
			end
		end

		if musicTime > 98214 then
			if not lavaHappened[49] then
				Timer.tween(0.2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[49] = true
			end
		end


		--old ones start here

		if musicTime > 98571.42 then
			if not lavaHappened[50] then
				Timer.tween(8, lava, {x = lava.x, y = 250}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[50] = true
			end
		end

		if musicTime > 110000 then
			if not lavaHappened[51] then
				Timer.tween(2, lava, {x = lava.x, y = 500}, "out-quad")
				lavaNum = lavaNum + 1
			end
			lavaHappened[51] = true
		end

		if musicTime > 121428.571 then
			if not lavaHappened[52] then
				Timer.tween(5.5, lava, {x = lava.x, y = 250}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[52] = true
			end
		end

		if musicTime > 127142.857 then
			if not lavaHappened[53] then
				Timer.tween(0.7, lava, {x = lava.x, y = 1000}, "out-quad")
				lavaNum = lavaNum + 1
				lavaHappened[53] = true
			end
		end

		--]]

		

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
				booOne:draw()
				booTwo:draw()

				if IHYTextHasHappened then
					text:draw()
				end

				candle:draw()
				candleOne:draw()
			--	love.graphics.setColor(0, 0, 0, 0)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				LayerOne:draw()

				--[[
				for i = -500, 500, 1000 do  -- guglio why
					mario.x = i
					mario:draw()
				end

				--]]
				mario:draw()
				marioTwo:draw()

				--enemy:draw()
				--boyfriend:draw()
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

