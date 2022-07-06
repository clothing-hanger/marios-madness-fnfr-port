--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.1.0 beta 2

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

function love.load()
	local curOS = love.system.getOS()

	simoc = false -- this is important :)
	--               is it tho?  
	--					YES GUGLIO, IT IS IMPORTANT
	mechanics = true

	
	--load sounds
	selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")

	-- Load libraries
	baton = require "lib.baton"
	ini = require "lib.ini"
	lovesize = require "lib.lovesize"
	Gamestate = require "lib.gamestate"
	Timer = require "lib.timer"


	-- Load modules
	status = require "modules.status"
	audio = require "modules.audio"
	graphics = require "modules.graphics"

	-- Load settings
	settings = require "settings"

	-- this is a module but settings needs to be loaded first, dont move this
	input = require "modules.input"

	-- Load states
	clickStart = require "states.click-start"
	debugMenu = require "states.debug-menu"
<<<<<<< HEAD
	--menu = require "states.menu"  -- old menu  not needed anymore      the shitty placeholder one
=======
	menu = require "states.menu"  -- old menu  not needed anymore      the shitty placeholder one
>>>>>>> aeff10032501fe984ec143bda2be07624361476f
	weeks = require "states.weeks"
	weeksPixel = require "states.weeks-pixel"
	menuCredits = require "states.menu-credits"
	titleScreen = require "states.menu.menu"
	weeksMenu = require "states.menu.menuWeek"
	songsMenu = require "states.menu.songsMenu"
<<<<<<< HEAD
	powerdownControls = require "states.menu.controls"
	shoulderWeeks = require "states.shoulderWeeks"
	faceWeeks = require "states.faceWeeks"
=======
>>>>>>> aeff10032501fe984ec143bda2be07624361476f



	-- Load substates
	gameOver = require "substates.game-over"
	gameOverPixel = require "substates.game-over-pixel"
	apparitionGameOver = require "substates.apparitiongameover"

	-- load songs as states
	songItsAMe = require "weeks.its-a-me"
	songGoldenLand = require "weeks.golden-land"
	songIHateYou = require "weeks.i-hate-you"
	songAlone =  require "weeks.alone"
	songApparition = require "weeks.apparition"
	songPowerdown = require "weeks.powerdown"  -- do not use
	songPowerdownShoulderDodge = require "weeks.powerdownShoulder"
	songPowerdownFaceDodge = require "weeks.powerdownFace"
	--songRacetraitors = require "weeks.racetraitors"


	-- load songs as states
	songItsAMe = require "weeks.its-a-me"
	songGoldenLand = require "weeks.golden-land"
	songIHateYou = require "weeks.i-hate-you"
	songAlone =  require "weeks.alone"
	songApparition = require "weeks.apparition"
	songPowerdown = require "weeks.powerdown"
	--songRacetraitors = require "weeks.racetraitors"


	--load images
	loadingScreen = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/loading")))
	loadingScreen.sizeX, loadingScreen.sizeY = 0.7, 0.7
	loadingScreen.x, loadingScreen.y = 650, 350
	-- Load week data
	weekData = {
		require "weeks.its-a-me",
		require "weeks.golden-land",
		require "weeks.i-hate-you",
		require "weeks.alone", --same 
		require "weeks.apparition",
		require "weeks.powerdown",
		--require "weeks.racetraitors"
	}

	-- LÖVE init
	if curOS == "OS X" then
		love.window.setIcon(love.image.newImageData("icons/macos.png"))
	else
		love.window.setIcon(love.image.newImageData("icons/default.png"))
	end

	lovesize.set(1280, 720)

	-- Variables
	font = love.graphics.newFont("fonts/vcr.ttf", 24)
	marioFont = love.graphics.newFont("fonts/mario.ttf", 24)

	weekNum = 1
	songDifficulty = 2

	spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}

	storyMode = false
	countingDown = false

	cam = {x = 0, y = 0, sizeX = 0.9, sizeY = 0.9}
	camScale = {x = 0.9, y = 0.9}
	uiScale = {x = 0.7, y = 0.7}

	musicTime = 0
	health = 0

	if curOS == "Web" then
		Gamestate.switch(clickStart)  -- why is this even still here
	else
		Gamestate.switch(titleScreen)
	end
end

function love.resize(width, height)
	lovesize.resize(width, height)
end

function love.keypressed(key)
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
	elseif key == "7" then
		Gamestate.switch(debugMenu)
		
    elseif key == "-" then
        if volume < 0.2 then
            love.audio.setVolume(0)

        elseif volume ~= 0 then
            audio.playSound(selectSound)
            love.audio.setVolume(volume - 0.1)
        end

    elseif key == "=" then
        audio.playSound(selectSound)
        love.audio.setVolume(volume + 0.1)

    elseif key == "0" then
        if volume ~= 0 then
            lastVolume = volume
            love.audio.setVolume(0)

        elseif volume == 0 then
            love.audio.setVolume(lastVolume)

        end
	else
		Gamestate.keypressed(key)
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.update(dt)
	volume = love.audio.getVolume()
	dt = math.min(dt, 1 / 30)

	input:update()

	if status.getNoResize() then
		Gamestate.update(dt)
	else
		love.graphics.setFont(font)
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.update(dt)
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setFont(font)
	end

	Timer.update(dt)
end

function love.draw()
	love.graphics.setFont(font)
	if status.getNoResize() then
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		love.graphics.setFont(font)

		if status.getLoading() then
			love.graphics.setColor(202 / 255, 1, 77 / 255)
			love.graphics.rectangle("fill", 0, 0, 1281, 721)
			-- one pixel too large to piss off guglio lmfao
			love.graphics.setColor(1, 1, 1)
			loadingScreen:draw()
		end
	else
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		lovesize.begin()
			graphics.setColor(1, 1, 1) -- Fade effect on
			Gamestate.draw()
			love.graphics.setColor(1, 1, 1) -- Fade effect off
			love.graphics.setFont(font)

			if status.getLoading() then
				love.graphics.setColor(96 / 255, 0, 0)
				love.graphics.rectangle("fill", 0, 0, 1281, 721)
				-- one pixel too large to piss off guglio lmfao
				love.graphics.setColor(1, 1, 1)
				loadingScreen:draw()
			end
		lovesize.finish()
	end
	graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())

	-- Debug output
	if settings.showDebug then
		love.graphics.print(status.getDebugStr(settings.showDebug), 5, 5, nil, 0.5, 0.5)
	end
end
