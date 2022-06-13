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

		weekNumber = "golden-land"

		--cam.sizeX, cam.sizeY = 0.2, 0.2
		--camScale.x, camScale.y = 0.2, 0.2

		song = songNum
		difficulty = songAppend

		LayerZero = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/BG")))
		LayerZero.sizeX, LayerZero.sizeY = 2.5, 2.5
		LayerOne = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/water")))
		LayerOne.sizeX, LayerOne.sizeY = 2.5, 2.5
		LayerOneDark = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/waterDark")))
		LayerOneDark.sizeX, LayerOneDark.sizeY = 2.5, 2.5
		LayerTwo = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/blocks")))
		LayerTwo.sizeX, LayerTwo.sizeY = 2.5, 2.5
		LayerThre = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/ground"))) --three is misspelled on purpose because idk for some reason when i typed three it didnt work so i just decided to try spelling it differently and then it did work??????????????????????
		LayerThre.sizeX, LayerThre.sizeY = 2.5, 2.5
		LayerThreeDark = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/groundDark")))
		LayerThreeDark.sizeX, LayerThreeDark.sizeY = 2.5, 2.5
		--Dark = graphics.newImage(love.graphics.newImage(graphics.imagePath("golden-land/dark"))) this needs to be in weeks.lua actually oops
		
		static = love.filesystem.load("sprites/golden-land/static.lua")()
		static.sizeX, static.sizeY = 3, 3
		girlfriend = love.filesystem.load("sprites/golden-land/girlfriend.lua")()
		girlfriend.sizeX, girlfriend.sizeY = 2.5, 2.5
		fakeGirlfriend = love.filesystem.load("sprites/golden-land/girlfriend.lua")()
		fakeGirlfriend.sizeX, fakeGirlfriend.sizeY = 2.5, 2.5
		enemy = love.filesystem.load("sprites/golden-land/mario.lua")()
		enemy.sizeX, enemy.sizeY = 2.5, 2.5
		enemyTwo = love.filesystem.load("sprites/golden-land/marioMad.lua")()
		enemyTwo.sizeX, enemyTwo.sizeY = 2.5, 2.5
		boyfriend = love.filesystem.load("sprites/golden-land/boyfriend.lua")()
		boyfriend.sizeX, boyfriend.sizeY = 2.5, 2.5

		if simoc then -- for if you play as simoc
			fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
			boyfriend = love.filesystem.load("sprites/simoc.lua")()
		end

		girlfriend.x, girlfriend.y = 30, -90
		fakeGirlfriend.x, fakeGirlfriend.y = 30, 500
		enemy.x, enemy.y = -380, -110
		enemyTwo.x, enemyTwo.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 25
		LayerThre.y = 200
		LayerThreeDark.y = 200
		LayerTwo.y = -375
		LayerOne.y = 200
		LayerOneDark.y = 200

		enemyIcon:animate("daddy dearest", false)
		static:animate("anim", true)
		fakeGirlfriend:animate("idle", true)

		self:load()
	end,

	load = function(self)
		weeks:load()

		inst = love.audio.newSource("music/golden-land/inst.ogg", "stream")
		voices = love.audio.newSource("music/golden-land/voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()


		weeks:generateNotes(love.filesystem.load("charts/golden-land/golden-land.lua")())
	end,

	update = function(self, dt)
		weeks:update(dt)
		static:update(dt)
		fakeGirlfriend:update(dt)

		delta = love.timer.getDelta()

		--cam.x, cam.y = -fakeGirlfriend.x, -fakeGirlfriend.y

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		if musicTime > 67221.3353 then
			if fakeGirlfriend.y == 500 then
				Timer.tween(0.8, fakeGirlfriend, {x = fakeGirlfriend.x, y = -90}, "out-sine")
				Timer.tween(0.2, cam, {x = cam.x - 95, y = cam.y + 95}, "in-out-elastic")
			end
		end
		
		if musicTime > 43773.06 then
			if musicTime < 43816.162 then
				Timer.tween(0.2, cam, {x = cam.x - 35, y = cam.y + 35}, "in-out-elastic")
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
				fakeGirlfriend:draw()
				LayerZero:draw()
				LayerOne:draw()
				LayerTwo:draw()
				love.graphics.setColor(173 / 255, 173 / 255, 173 / 255)
				love.graphics.rectangle("fill", -2000, 210, 10000, 10000)
				love.graphics.setColor(1, 1, 1)
				LayerThre:draw()

				if musicTime > 43772 then
					static:draw()
					LayerTwo:draw()
					fakeGirlfriend:draw()
				--	love.graphics.setColor(1, 1, 1, 0.3)
				--	love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
					LayerOneDark:draw()
					love.graphics.setColor(127 / 255, 127 / 255, 127 / 255)
					love.graphics.rectangle("fill", -2000, 210, 10000, 10000)
					love.graphics.setColor(1, 1, 1)
					LayerThreeDark:draw()
				end

				love.graphics.setColor(1, 1, 1)



			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				if musicTime > 43772 then
					enemyTwo:draw()
				else
					enemy:draw()
				end


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
		enemyTwo = nil
		LayerOne = nil
		LayerTwo = nil
		LayerThree = nil
		LayerThreeDark = nil
		fakeGirlfriend = nil

		weeks:leave()
	end
}
