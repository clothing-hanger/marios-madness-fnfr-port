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

		fading = 1
		fadingOne = 1
		fadingTwo = 1
		fadingThree = 1
		fadingFour = 1
		fadingFive = 1
		fadingSix = 1

		lightningOneHasHappened = false
		lightningTwoHasHappened = false
		lightningThreeHasHappened = false
		lightningFourHasHappened = false
		lightningFiveHasHappened = false
		lightningSixHasHappened = false
		lightningSevenHasHappened = false


		weekNumber = "alone"

		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("alone/BG")))
		mansion = graphics.newImage(love.graphics.newImage(graphics.imagePath("alone/mansion")))

		lightning = love.audio.newSource("sounds/week2/thunder1.ogg", "static")


		enemy = love.filesystem.load("sprites/alone/luigi.lua")()
		enemyTwo = love.filesystem.load("sprites/alone/luigi.lua")()
		boyfriend = love.filesystem.load("sprites/alone/boyfriend.lua")()
		rain = love.filesystem.load("sprites/alone/rain.lua")()
		girlfriend = love.filesystem.load("sprites/alone/girlfriend.lua")()
		hang = love.filesystem.load("sprites/alone/hang.lua")()
		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end
		
		enemy.x, enemy.y = -1380, -350
		enemy.sizeX, enemy.sizeY = 0.9, 0.9
		boyfriend.x, boyfriend.y = -735, -275
		boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8
		girlfriend.x, girlfriend.y = -1050, -425
		girlfriend.sizeX, girlfriend.sizeY = 0.8, 0.8
		LayerZero.x, LayerZero.y = -800, -300
		LayerZero.sizeX, LayerZero.sizeY = 1.3, 1.3
		rain.x, rain.y = -1000, -300
		rain.sizeX, rain.sizeY = 1.5, 1.5
		hang.x, hang.y = -710, -370

		enemyIcon:animate("daddy dearest", false)
		rain:animate("anim", true)
		hang:animate("anim", true)

		self:load()
	end,

	load = function(self)
		weeks:load()

		inst = love.audio.newSource("music/alone/inst.ogg", "stream")
		voices = love.audio.newSource("music/alone/voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/alone/alone.lua")())

	end,

	update = function(self, dt)
		weeks:update(dt)
		rain:update(dt)
		hang:update(dt)

		delta = love.timer.getDelta()
	
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

				LayerZero:draw()
				mansion:draw()
				girlfriend:draw()
				enemy:draw()
				boyfriend:draw()

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)
				

				if musicTime > 112500 then
					love.graphics.setColor(1, 1, 1, 1)
					rain:draw()
				end
				
				if musicTime >= 3750 then
					graphics.setColor(1, 1, 1, fading)
					if fading > 0 then fading = fading - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if not lightningOneHasHappened then
						lightning:play()
					end
					lightningOneHasHappened = true
				end

				if musicTime >= 33750 then
					graphics.setColor(1, 1, 1, fadingOne)
					if fadingOne > 0 then fadingOne = fadingOne - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if not lightningTwoHasHappened then
						lightning:play()
					end
					lightningTwoHasHappened = true
				end

				if musicTime >= 63750 then
					graphics.setColor(1, 1, 1, fadingTwo)
					if fadingTwo > 0 then fadingTwo = fadingTwo - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if not lightningThreeHasHappened then
						lightning:play()
					end
					lightningThreeHasHappened = true
				end

				if musicTime >= 82500 then --Bf hanging one figure this shit out
					graphics.setColor(1, 1, 1, fadingThree)
					if fadingThree > 0 then fadingThree = fadingThree - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					hang:draw()
					if not lightningFourHasHappened then
						lightning:play()
					end
					lightningFourHasHappened = true
				end

				if musicTime >= 105000 then 
					graphics.setColor(1, 1, 1, fadingFour)
					if fadingFour > 0 then fadingFour = fadingFour - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if not lightningFiveHasHappened then
						lightning:play()
					end
					lightningFiveHasHappened = true
				end

				if musicTime >= 112500 then  --rain
					graphics.setColor(1, 1, 1, fadingFive)
					if fadingFive > 0 then fadingFive = fadingFive - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					if not lightningSixHasHappened then
						lightning:play()
					end
					lightningSixHasHappened = true
				end


				if musicTime >= 138750 then  --bf hanging again 
					graphics.setColor(1, 1, 1, fadingSix)
					if fadingSix > 0 then fadingSix = fadingSix - 0.7 * delta end

					love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
					hang:draw()
					if not lightningSevenHasHappened then
						lightning:play()
					end
					lightningSevenHasHappened = true
				end

			
				love.graphics.setColor(1, 1, 1, 1)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		LayerZero = nil
		mansion = nil
		hang = nil
		rain = nil
		lightning = nil


		weeks:leave()
	end
}
