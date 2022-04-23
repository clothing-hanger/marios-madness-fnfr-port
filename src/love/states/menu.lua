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

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/title-bg")))
local simocLogo = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/simoc-logo")))

local girlfriendTitle = love.filesystem.load("sprites/menu/girlfriend-title.lua")()
local simocTitle = love.filesystem.load("sprites/menu/simoc.lua")()
local logoBumpin = love.filesystem.load("sprites/menu/logoBumpin.lua")()

local menuNames = {
	"Story Mode",
	"Freeplay",
	"Credits"
}

local weekMeta = {
	{
		"It's a Me",
		{
			"It's a Me"
		}
	},
	{
		"Golden Land",
		{
			"Golden Land"
		}
	},
	{
		"I Hate You",
		{
			"I Hate You"
		}
	},
	{
		"Alone",
		{
			"Alone"
		}
	},
	{
		"Apparition",
		{
			"Apparition"
		}
	},
	{
		"Powerdown",
		{
			"Powerdown"
		}
	},
	{
		"Racetraiors",
		{
			"Racetraitors"
		}
	}
}
local difficultyStrs = {
	--"-easy",
	"",
	--"-hard"
}

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

local music = love.audio.newSource("music/menu/menu.ogg", "stream")

local function switchMenu(menu)
	if menu == 4 then
		Gamestate.switch(menuCredits)
	elseif menu == 3 then
		function leftFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
			elseif menuState == 2 then
				songNum = (songNum > 1) and songNum - 1 or #weekMeta[weekNum][2]
			else
				weekNum = (weekNum > 1) and weekNum - 1 or #weekMeta
			end
		end
		function rightFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
			elseif menuState == 2 then
				songNum = (songNum < #weekMeta[weekNum][2]) and songNum + 1 or 1
			else
				weekNum = (weekNum < #weekMeta) and weekNum + 1 or 1
			end
		end
		function confirmFunc()
			if menuState == 3 then
				music:stop()

				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						songAppend = difficultyStrs[songDifficulty]

						storyMode = false

						Gamestate.switch(weekData[weekNum], songNum, songAppend)

						status.setLoading(false)
					end
				)
			else
				if menuState == 1 then
					songNum = 1
				end

				menuState = menuState + 1
			end
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			if menuState == 3 then
				if songDifficulty == 3 then
					love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
				elseif songDifficulty == 2 then
					love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
				end
			elseif menuState == 2 then
				love.graphics.printf("Choose a song: < " .. weekMeta[weekNum][2][songNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			else
				love.graphics.printf("Choose a week: < " .. weekMeta[weekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	elseif menu == 2 then
		weekNum = 1
		songNum = 1

		function leftFunc()
			if menuState == 2 then
				songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
			else
				weekNum = (weekNum > 1) and weekNum - 1 or #weekMeta
			end
		end
		function rightFunc()
			if menuState == 2 then
				songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
			else
				weekNum = (weekNum < #weekMeta) and weekNum + 1 or 1
			end
		end
		function confirmFunc()
			if menuState == 2 then
				music:stop()

				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						songAppend = difficultyStrs[songDifficulty]

						storyMode = true

						Gamestate.switch(weekData[weekNum], songNum, songAppend)

						status.setLoading(false)
					end
				)
			else
				menuState = menuState + 1
			end
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			if menuState == 2 then
				if songDifficulty == 3 then
					love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
				elseif songDifficulty == 2 then
					love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
				end
			else
				love.graphics.printf("Choose a week: < " .. weekMeta[weekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	else
		function leftFunc()
			menuNum = (menuNum > 1) and menuNum - 1 or #menuNames
		end
		function rightFunc()
			menuNum = (menuNum < #menuNames) and menuNum + 1 or 1
		end
		function confirmFunc()
			switchMenu(menuNum + 1)
		end
		function backFunc()
			graphics.fadeOut(0.5, love.event.quit)
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			love.graphics.printf("< " .. menuNames[menuNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Exit", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Exit", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	end

	menuState = 1
end

logoBumpin.x, logoBumpin.y = -350, -125
simocLogo.x, simocLogo.y = -350, -125
simocLogo.sizeX, simocLogo.sizeY = 0.6, 0.6

girlfriendTitle.x, girlfriendTitle.y = 300, -75
simocTitle.x, simocTitle.y = 300, -75

music:setLooping(true)

return {
	enter = function(self, previous)
		songNum = 0

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		music:play()
	end,

	update = function(self, dt)
		girlfriendTitle:update(dt)
		simocTitle:update(dt)
		logoBumpin:update(dt)

		if not graphics.isFading() then
			if input:pressed("left") then
				audio.playSound(selectSound)

				leftFunc()
			elseif input:pressed("right") then
				audio.playSound(selectSound)

				rightFunc()
			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				backFunc()
			elseif input:pressed("simoc") then
				if not simoc then
					simoc = true
				else
					simoc = false
				end
			elseif input:pressed("mechanicsInput") then
				if not mechanics then
					mechanics = true
				else
					mechanics = false
				end
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			titleBG:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				
				if not simoc then
					logoBumpin:draw() -- this is the best way to make things switch out for other things, load them both but only draw whichever one is currently needed
					girlfriendTitle:draw()
				else
					simocLogo:draw()
					simocTitle:draw()
				end

				if not simoc then
					love.graphics.printf(
						"CH Engine v1.2.1\n" ..
						"CH Engine by Clothing Hanger\n\n" ..
						"FNFR Developed by HTV04\n\n" ..
						"Original game by Funkin' Crew, in association with Newgrounds",
						-525,
						90,
						450,
						"center",
						nil,
						1,
						1
					)
				else
					love.graphics.printf(
						"simoc the rat is the best thing you have ever seen\n\n" ..
						"if you say simoc is not the best thing you have ever seen\n" ..
						"i will cut your fingers off\n\n" ..
						":)",
						-525,
						90,
						450,
						"center",
						nil,
						1,
						1
					)
				end

				if mechanics then
					love.graphics.printf("Mechanics are enabled. (press M key to toggle)", -640, -380, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Mechanics are disabled. (press M key to toggle)", -640, -380, 853, "center", nil, 1.5, 1.5)
				end


				if simoc then
					love.graphics.printf(
						"look at him\n\n" ..
						"he is sexy",
						0,
						0,
						200,
						"center",
						nil,
						1.3,
						1.3
					)
				end

				drawFunc()
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		music:stop()

		Timer.clear()
	end
}
