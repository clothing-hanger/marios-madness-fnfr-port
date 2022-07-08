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

		bgTwo = graphics.newImage(love.graphics.newImage(graphics.imagePath("racetraitors/bgTwo")))
		bgThree = graphics.newImage(love.graphics.newImage(graphics.imagePath("racetraitors/bgThree")))
		shell = graphics.newImage(love.graphics.newImage(graphics.imagePath("racetraitors/shell")))



		enemy = love.filesystem.load("sprites/racetraitors/mario.lua")()
		boyfriend = love.filesystem.load("sprites/racetraitors/boyfriend.lua")()
		girlfriend = love.filesystem.load("sprites/racetraitors/girlfriend.lua")()
		bgOne = love.filesystem.load("sprites/racetraitors/bg.lua")()

		item = love.filesystem.load("sprites/racetraitors/item.lua")()

		talkOne = love.filesystem.load("sprites/racetraitors/talkOne.lua")()
		talkTwo = love.filesystem.load("sprites/racetraitors/talkTwo.lua")()
		talkThree = love.filesystem.load("sprites/racetraitors/talkThree.lua")()

		talkOne.x = 0
		talkTwo.x = 0
		talkThree.x = 0

		talkOne.y = -110
		talkTwo.y = -110
		talkThree.y = -110


		shellCrack = love.audio.newSource("sounds/racetraitors/shell.ogg", "stream")
		
		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = 0, -110
		boyfriend.x, boyfriend.y = 260, 100


		enemy:setAnimSpeed(12)
		enemyIcon:animate("golden land", false)

		self:load()

		marioTalk = function()
				Timer.script(function(wait)
					talkOneIsHappening = true
					--talkOne:animate("anim", false)
					wait(3.1)
					talkOneIsHappening = false
					talkTwoIsHappening = true

				
					--talkTwo:animate("anim", false)
					
					wait(2.5)
					talkTwoIsHappening = false
					talkThreeIsHappening = true
					--talkThree:animate("anim", false)

				

				
					wait(2)
					talkThreeIsHappening = false
					talkHasHappened = true
				end)
				

				
















			--[[
			talkHasHappened = true
			talkOneIsHappening = true
			talkOne:animate("anim", false)
			if not talkOne:isAnimated() then
				if musicTime > 1866 then
					if not talkTwoHasHappened then
						talkOneIsHappening = false
						talkTwoIsHappening = true
						talkTwo:animate("anim", false)
						talkTwoHasHappened = true
					end
				end
			end
			if not talkTwo:isAnimated() then
				if musicTime > 1866 then
					if not talkThreeHasHappened then
						talkThree:animate("anim", false)
						talkTwoIsHappening = false
						talkThreeIsHappening = true
						talkThreeHasHappened = true
					end 
				end
			end

			-]]





		end

		shellFunc = function()
			shell.x = -500
			Timer.tween(0.7, shell, {x = -300}, "linear")
			shellCrack:play()
			health = health - 2
		end

		marioDriveIn = function()

			marioDriveInHasHappened = true

			Timer.tween(1.5, enemy, {x = talkOne.x - 380}, "out-back")
			Timer.tween(1.5, talkOne, {x = -380}, "out-back")
			Timer.tween(1.5, talkTwo, {x = -380}, "out-back")
			Timer.tween(1.5, talkThree, {x = -380}, "out-back")
		end

		item:animate("empty", true)

		item:setAnimSpeed(12)
	end,

	load = function(self)

		talkHasHappened = false
		talkTwoHasHappened = false
		talkThreeHasHappened = false

		talkOneIsHappening = false
		talkTwoIsHappening = false
		talkThreeIsHappening = false
		wtfEvenAreTheseBooleanNamesAnymoreOne = false
		wtfEvenAreTheseBooleanNamesAnymoreTwo = false
		wtfEvenAreTheseBooleanNamesAnymoreThree = false

		marioDriveInHasHappened = false
		weeks:load()

		inst = love.audio.newSource("music/racetraitors/inst.ogg", "stream")
		voices = love.audio.newSource("music/racetraitors/voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/racetraitors/racetraitors.lua")())
	end,

	update = function(self, dt)
		weeks:update(dt)

		talkOne:update(dt)
		talkTwo:update(dt)
		talkThree:update(dt)

		item:update(dt)
		bgOne:update(dt)

		if musicTime > 1846 then
			if not talkHasHappened then
			--	shellFunc()
				marioTalk()
			end
		end

		if musicTime > 567 and not marioDriveInHasHappened then
			marioDriveIn()
		end

		--[[

		if musicTime > 1846 then
			talkOne:animate("anim", false)
		end


		if musicTime > 3807 then
			talkTwo:animate("anim", false)
		end


		--]]

		if talkOneIsHappening and not wtfEvenAreTheseBooleanNamesAnymoreOne then
			wtfEvenAreTheseBooleanNamesAnymoreOne = true
			talkOne:animate("anim", false)
		end

		if talkTwoIsHappening and not wtfEvenAreTheseBooleanNamesAnymoreTwo then
			wtfEvenAreTheseBooleanNamesAnymoreTwo = true
			talkTwo:animate("anim", false)
		end

		if talkThreeIsHappening and not wtfEvenAreTheseBooleanNamesAnymoreThree then
			wtfEvenAreTheseBooleanNamesAnymoreThree = true
			talkThree:animate("anim", false)
		end
		

		if musicTime >= 39346 then
			if item:getAnimName() == "empty" then
				item:animate("random", true)
			end
		end

		if musicTime >= 40615 then
			if item:getAnimName() == "random" then
				item:animate("shell", true)
			end
		end

		if musicTime >= 55384 then
			if item:getAnimName() == "shell" then
				item:animate("ghost", true)
			end
		end

		
		if musicTime >= 70153 then
			if item:getAnimName() == "ghost" then
				item:animate("random", true)
			end
		end

		if item:getAnimName() == "ghost" then
			ghostArrows = true
		else
			ghostArrows = false
		end

		if musicTime > 42000 and musicTime < 42115 then
			shellFunc()
		end
		if musicTime > 43846 and musicTime < 43961 then
			shellFunc()
		end
		if musicTime > 47769 and musicTime < 47884 then
			shellFunc()
		end
		if musicTime > 55153 and musicTime < 55269 then
			shellFunc()
		end



		if shell.x < -10 then
			shellDraw = false
		else 
			shellDraw = true
		end

		

		if health >= 80 then
			if enemyIcon:getAnimName() == "golden land" then
				enemyIcon:animate("golden land", false)
			end
		else
			if enemyIcon:getAnimName() == "golden land" then
				enemyIcon:animate("golden land", false)
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
						Gamestate.switch(songsMenu)

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

				bgTwo:draw()
				bgThree:draw()

				bgOne:draw()


				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				if musicTime > 9230 then
					enemy:draw()
				end
	
				boyfriend:draw()

				if talkOneIsHappening and musicTime < 9230 then
					talkOne:draw()
				end
				if talkTwoIsHappening and musicTime < 9230 then
					talkTwo:draw()
				end
				if talkThreeIsHappening and musicTime < 9230 then
					talkThree:draw()
				end



				shell:draw()

				item:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)


			love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)

		weeks:leave()
	end
}
