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

local function switchMenu(songsMenu)
	function backFunc()
		Gamestate.switch(titleScreen)
	end

	--menuState = 1      not needed 
end


return {
	enter = function(self, previous)

		music:play()

		fading = 1



		weekOneImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week0")))
		weekTwoImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week1")))
		weekThreeImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week2")))
		weekFourImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week3")))
		weekFiveImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week4")))
		weekSixImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week5")))
		creditsImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/creditsTile")))

		circleThing = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/circleThingIdfk")))
		selectSong = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/selectSong")))

		static = love.filesystem.load("sprites/menu/static.lua")()

		static.sizeX, static.sizeY = 1.2, 1.2
		circleThing.sizeX, circleThing.sizeY = 1.2, 1.2

		selectSong.y = -300

		static:animate("anim", true)

		weekOneImage.x = 0
		weekTwoImage.x = 420
		weekThreeImage.x = 840
		weekFourImage.x = 1260
		weekFiveImage.x = 1680
		weekSixImage.x = 2100
		creditsImage.x = 2520

		songName = "It's a Me"



		changingMenu = false
		songNum = 0
		menuSongNum = 1

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9


		graphics.setFade(0)
		graphics.fadeIn(0.5)

		function tweenSelectSong()
			Timer.tween(2.5, selectSong, {y = selectSong.y + 25}, "in-out-quad", function()
				Timer.tween(2.5, selectSong, {y = selectSong.y - 25}, "in-out-quad", function()
					tweenSelectSong()
				end)
			end)
		end

		tweenSelectSong()


	end,




	update = function(self, dt)
		delta = love.timer.getDelta()


		if menuSongNum == 1 then
			songName = "Its a Me"
		elseif menuSongNum == 2 then
			songName = "Golden Land"
		elseif menuSongNum == 3 then
			songName = "I Hate You"
		elseif menuSongNum == 4 then
			songName = "Alone"
		elseif menuSongNum == 5 then
			songName = "Apparition"
		elseif menuSongNum == 6 then
			songName = "Powerdown"
		else 
			songName = "Credits" 
		end

		static:update(dt)

		if not graphics.isFading() then
			if input:pressed("confirm") then

				if menuSongNum == 1 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(songItsAMe)
		
							status.setLoading(false)
						end
					)
				elseif menuSongNum == 2 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(songGoldenLand)
		
							status.setLoading(false)
						end
					)
				elseif menuSongNum == 3 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(songIHateYou)
		
							status.setLoading(false)
						end
					)
				elseif menuSongNum == 4 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(songAlone)
		
							status.setLoading(false)
						end
					)
				elseif menuSongNum == 5 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(songApparition)
		
							status.setLoading(false)
						end
					)
				elseif menuSongNum == 6 then
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							if love.system.getOS() == "NX" then
								Gamestate.switch(powerdownControls)
							else
								Gamestate.switch(songPowerdownFaceDodge)
								--Gamestate.switch(songRacetraitors)
							end
							status.setLoading(false)
						end
					)
				else --menuSongNum == 7
					titleScreen:musicStop()
					songNum = 1
					status.setLoading(true)
					graphics.fadeOut(
						0.5,
						function()
							Gamestate.switch(menuCredits)
		
							status.setLoading(false)
						end
					)
				end

			
			elseif input:pressed("left") then
				if menuSongNum ~= 1 then
					selectSound:play()
					menuSongNum = menuSongNum - 1
					Timer.tween(0.2, weekOneImage, {x = weekOneImage.x + 420}, "out-quad")
					Timer.tween(0.2, weekTwoImage, {x = weekTwoImage.x + 420}, "out-quad")
					Timer.tween(0.2, weekThreeImage, {x = weekThreeImage.x + 420}, "out-quad")
					Timer.tween(0.2, weekFourImage, {x = weekFourImage.x + 420}, "out-quad")
					Timer.tween(0.2, weekFiveImage, {x = weekFiveImage.x + 420}, "out-quad")
					Timer.tween(0.2, weekSixImage, {x = weekSixImage.x + 420}, "out-quad")
					Timer.tween(0.2, creditsImage, {x = creditsImage.x + 420}, "out-quad")
				end
			elseif input:pressed("right") then
				if menuSongNum ~= 7 then
					selectSound:play()
					menuSongNum = menuSongNum + 1
					Timer.tween(0.2, weekOneImage, {x = weekOneImage.x - 420}, "out-quad")
					Timer.tween(0.2, weekTwoImage, {x = weekTwoImage.x - 420}, "out-quad")
					Timer.tween(0.2, weekThreeImage, {x = weekThreeImage.x - 420}, "out-quad")
					Timer.tween(0.2, weekFourImage, {x = weekFourImage.x - 420}, "out-quad")
					Timer.tween(0.2, weekFiveImage, {x = weekFiveImage.x - 420}, "out-quad")
					Timer.tween(0.2, weekSixImage, {x = weekSixImage.x - 420}, "out-quad")
					Timer.tween(0.2, creditsImage, {x = creditsImage.x - 420}, "out-quad")
				end
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(titleScreen)
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				love.graphics.setColor(1, 1, 1)

	

				love.graphics.rectangle("fill", -2000, -2000, 10000, 10000)

				
				circleThing:draw()

				love.graphics.setColor(1, 1, 1, 0.35)

				static:draw()
				love.graphics.setColor(1, 1, 1, 1)
				weekOneImage:draw()
				weekTwoImage:draw()
				weekThreeImage:draw()
				weekFourImage:draw()
				weekFiveImage:draw()
				weekSixImage:draw()
				creditsImage:draw()


				love.graphics.setColor(1, 0, 0)

				love.graphics.setFont(marioFont)

				love.graphics.printf(songName, -640, 285, 853, "center", nil, 1.5, 1.5)

				love.graphics.setFont(font)

				love.graphics.setColor(1, 1, 1)

				selectSong:draw()


				graphics.setColor(0, 0, 0, fading)
				if fading > 0 then fading = fading - 0.3 * delta end

				love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)

				love.graphics.setColor(1, 1, 1, 1)


				--[[

				love.graphics.printf(
					menuSongNum,
					-525,
					90,
					1200,
					"left",
					nil,
					1.6,
					1.6
				)

				--]]




			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)


		--nil 


		Timer.clear()
	end
}
