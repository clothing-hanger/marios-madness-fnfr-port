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

local upFunc, downFunc, confirmFunc, backFunc, drawFunc, menuFunc, menuDesc, trackNames

local menuState

local menuNum = 1

weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local weekDesc = { -- Add your week description here
	"It's-a Me",
	"Golden Land",
	"I Hate You",
	"Apparition",
	"Alone"
}
local difficultyStrs = { 
	"easy",
	"normal",
	"hard"
}

trackNames = { -- add your songs here
	{
		"1 "
	},
	{
		" 2",
		" ",
		" "
	},
	{
		" 3",
		" ",
		" "
	},
	{
		" 4",
		" ",
		" "
	},
	{
		" 5",
		" ",
		" "
	},
	{
		"6",
		"",
		""
	}
}

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

local function switchMenu(menu)

end

return {
	enter = function(self, previous)
		songNum = 0
		weekNum = 1	

		weekButtonX = {
			[1] = 0,
			[2] = 500,
			[3] = 1000,
			[4] = 1500,
			[5] = 2000,
			[6] = 2500
		}


		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		
		titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/weekMenu")))

		difficultyAnim = love.filesystem.load("sprites/menu/difficulty.lua")()

		difficultyAnim.x, difficultyAnim.y = 400, 220

		weekImages = {}
		for i = 1, #weekDesc do
			table.insert(weekImages, graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/week" .. i-1))))
		end

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		function confirmFunc()
			titleScreen:musicStop()
			songNum = 1

			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					
					songAppend = difficultyStrs[songDifficulty]

					storyMode = true

					Gamestate.switch(weekData[weekNum], songNum, songAppend, weekNum, trackNames)

					status.setLoading(false)
				end
			)
		end
		
	end,

	update = function(self, dt)
		for i = 1, #weekDesc-1 do
			weekImages[i].x = weekButtonX[i]
		end

		function menuFunc()

			weekBefore = weekImages[weekNum - 1]
			weekAfter = weekImages[weekNum + 1]

		end

		if songDifficulty == 1 then
			difficultyAnim:animate("easy", true)
		elseif songDifficulty == 2 then
			difficultyAnim:animate("normal", true)
		elseif songDifficulty == 3 then
			difficultyAnim:animate("hard", true)
		end

		difficultyAnim:update(dt)

		if not graphics.isFading() then
			if not music:isPlaying() then
				music:play()
			end
			if input:pressed("right") then
				audio.playSound(selectSound)



				if weekNum ~= 6 then
					weekNum = weekNum + 1
				--	colourTween()
					for i = 1, 5 do
						Timer.tween(0.2, weekButtonX, { [i] = weekButtonX[i] - 500}, "out-expo")
					end
				else
					weekNum = 1
					--colourTween()
					for i = 1, #weekDesc-1 do
						Timer.tween(0.2, weekButtonX, { [i] = 120 + 500*i}, "out-expo")
					end
				end

				
				menuFunc()
			elseif input:pressed("left") then
				audio.playSound(selectSound)


				if weekNum ~= 1 then
					weekNum = weekNum - 1
					--colourTween()
					for i = 1, #weekDesc-1 do
						Timer.tween(0.1, weekButtonX, { [i] = weekButtonX[i] + 500 }, "out-expo")
					end
				else
					weekNum = #trackNames
					--colourTween()
					for i = 1, #weekDesc-1 do
						Timer.tween(0.1, weekButtonX, { [i] = 220 - (700 - 500*i)}, "out-expo")
					end
				end

				
				menuFunc()
			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(menuSelect)
			end
		end
		currentWeek = weekImages[weekNum]
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			titleBG:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				for i = 1, 5 do
					weekImages[i]:draw()
				end

				--graphics.setColor(0, 0, 0)
				
				--love.graphics.rectangle("fill", -1000, -351, 2500, -100) 

				--graphics.setColorF(freeColour[1], freeColour[2], freeColour[3])

				--love.graphics.rectangle("fill", -1000, -351, 2500, 411) 

				--graphics.setColor(1, 1, 1)

				difficultyAnim:draw()
				--love.graphics.color.printf(weekDesc[weekNum], -585, -395, 853, "right", nil, 1.5, 1.5)

				--love.graphics.color.printf("TRACKS", -1050, 140, 853, "center", nil, 1.5, 1.5, 255, 117, 172)
			--	for trackLength = 1, #trackNames[weekNum] do
				--	love.graphics.color.printf(trackNames[weekNum][trackLength], -1050, 135 + (35 * trackLength), 853, "center", nil, 1.5, 1.5, 255, 117, 172)
				--end

			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		titleBG = nil
		difficultyAnim = nil
		Timer.clear()
	end
}