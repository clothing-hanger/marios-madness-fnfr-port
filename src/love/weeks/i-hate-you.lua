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

		weekNumber = "i-hate-you"  -- haha just like how the marios madness devs hate me    why do they keep ignoring me 
--[[----------------------------------------------------------------------------

none of this works and it was a huge waste of time

i want to delete this port but i have spent too much time on it 


		lavaOne = false
		lavaTwo = false
		lavaThree = false
		lavaFour = false
		lavaFive = false
		lavaSix = false
		lavaSeven = false
		lavaEight = false
		lavaNine = false
		lavaTen = false
		lavaEleven = false
		lavaTwelve = false
		lavaThirteen = false
		lavaFourteen = false 
		-- do not ask what happened to lavaFifteen
		lavaSixteen = false
		lavaSeventeen = false
		lavaEighteen = false
		lavaNinteen = false
		lavaTwenty = false
		lavaTwentyone = false
		lavaTwentytwo = false
		lavaTwentythree = false
		lavaTwentyfour = false
		lavaTwentyfive = false

		lavaIsUp = false
		lavaIsUpAgain = false
------------------------------------------------------------------------------]]
		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/bg")))
		LayerOne = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/floor")))
		text = graphics.newImage(love.graphics.newImage(graphics.imagePath("i-hate-you/text")))

		boo = love.filesystem.load("sprites/i-hate-you/boo.lua")()
		candle = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		candleOne = love.filesystem.load("sprites/i-hate-you/candle.lua")()
		mario = love.filesystem.load("sprites/i-hate-you/mario.lua")()
		marioTwo = love.filesystem.load("sprites/i-hate-you/mario.lua")()

		boyfriend = love.filesystem.load("sprites/i-hate-you/boyfriend.lua")()
		girlfriend = love.filesystem.load("sprites/i-hate-you/girlfriend.lua")()
		enemy = love.filesystem.load("sprites/i-hate-you/luigi.lua")()
		enemyTwo = love.filesystem.load("sprites/i-hate-you/luigi.lua")()
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		
		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100
		mario.x, mario.y = -500, 50
		marioTwo.x, marioTwo.y = 500, 50

		enemyIcon:animate("daddy dearest", false)
		boo:animate("anim", true)
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

		if musicTime >= 10000 then
			if mario:getAnimName() == "empty" then
				mario:animate("grab", true)
			--	weeks:safeAnimate(mario, "grab")
			end
			if mario:getAnimName() == "empty" then
				marioTwo:animate("grab", true)
			--	weeks:safeAnimate(marioTwo, "grab")
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









	--	if musicTime > 81428.571 then
	--		if not lavaOne then
	--			Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
	--			lavaOne = true
	--		end
	--	end

--[[

		--if musicTime > 81785.714 then
		--	if not lavaTwo then
		--		Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
		--		lavaTwo = true
		--	end
	--	end

		if musicTime > 82142.857 then
			if not lavaThree then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaThree = true
			end
		end

	--	if musicTime > 82500 then
	--		if not lavaFour then
	--			Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
		--		lavaFour = true
	--		end
	--	end

		if musicTime > 82857.142 then
			if not lavaFive then
				Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
				laveFive = true
			end
		end

	--	if musicTime > 83214.285 then
	--		if not lavaSix then
	--			Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
	--			lavaSix = true
	--		end
	--	end

		if musicTime > 83571.428 then
			if not lavaSeven then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaSeven = true
			end
		end

	--	if musicTime > 83921.571 then
	--		if not lavaEight then
	--			Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
	--			lavaEight = true
	--		end
	--	end

		if musicTime > 84285.714 then
			if not lavaNine then
				Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
				lavaNine = true
			end
		end

	--	if musicTime > 84642.857 then
	--		if not lavaTen then
	--			Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
	--			lavaTen = true
	--		end
	--	end

		if musicTime > 85000 then
			if not lavaEleven then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaEleven = true
			end
		end

--		if musicTime > 85357.142 then
--			if not lavaTwelve then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaTwelve = true
--			end
--		end

		if musicTime > 85714.285 then
			if not lavaThirteen then
				Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
				lavaThirteen = true
			end
		end

--		if musicTime > 86071.428 then
--			if not lavaFourteen then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaFourteen = true
--			end
--		end

		if musicTime > 86428.571 then
			if not lavaSixteen then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaSixteen = true
			end
		end

--		if musicTime > 86785.714 then
--			if not lavaSeventeen then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaSeventeen = true
--			end
--		end

		if musicTime > 87142.857 then
			if not lavaEighteen then
				Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
				lavaEighteen = true
			end
		end

--		if musicTime > 87500 then
--			if not lavaNinteen then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaNinteen = true
--			end
--		end

		if musicTime > 87857.142 then
			if lavaTwenty then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaTwenty = true
			end
		end

--		if musicTime > 88214.285 then
--			if not lavaTwentyone then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaTwentyone = true
--			end
--		end

		if musicTime > 88571.428 then
			if not lavaTwentytwo then
				Timer.tween(0.1, lava, {x = lava.x, y = 600}, "linear")
				lavaTwentytwo = true
			end
		end

--		if musicTime > 88928.571 then
--			if not lavaTwentythree then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaTwentythree = true
--			end
--		end

		if musicTime > 89285 then
			if not lavaTwentyfour then
				Timer.tween(0.1, lava, {x = lava.x, y = 650}, "linear")
				lavaTwentyfour = true
			end
		end

--		if musicTime > 89642 then
--			if not lavaTwentyfive then
--				Timer.tween(0.1, lava, {x = lava.x, y = 700}, "linear")
--				lavaTwentyfive = true
--			end
--		end

--]]  
--[[
	if musicTime > 98571.42 then
		if lava.y == 500 then
			Timer.tween(5, lava, {x = lava.x, y = -40}, "linear")
			lavaIsUp = true
		end
	end

	if musicTime > 110000 then
		if lavaIsUp then
			lavaIsUp = false
			Timer.tween(2.857, lava, {x = lava.x, y = 601}, "linear")
		end
	end

	--if musicTime > 121428.571 then
	--	if lava.y == -601 then
	--		Timer.tween(5.714, lava, {x = lava.x, y = -41}, "linear")
	--	end
	--end

	if musicTime > 121428.571 then
		if not lavaIsUp then
			lavaIsUpAgain = true
			Timer.tween(4.286, lava, {x = lava.x, y = -41}, "linear")
		end
	end

	--if musicTime > 127142.857 then
	--	if lavaIsUpAgain then
	--		lavaIsUpAgain = false
	--		Timer.tween(0.2, lava, {x = lava.x, y = 500}, "linear")
	--	end
	--end
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
				text:draw()
				candle:draw()
				candleOne:draw()
			--	love.graphics.setColor(0, 0, 0, 0)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				LayerOne:draw()
				mario:draw()
				marioTwo:draw()

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

