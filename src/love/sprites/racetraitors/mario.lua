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

return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("racetraitors/mario")),
	-- Automatically generated from Race_Mario_Assets.xml
	{
		{x = 0, y = 0, width = 1075, height = 634, offsetX = 0, offsetY = -28, offsetWidth = 1075, offsetHeight = 662}, -- 1: RacistDown0000
		{x = 1075, y = 0, width = 1075, height = 657, offsetX = 0, offsetY = -2, offsetWidth = 1075, offsetHeight = 662}, -- 2: RacistDown0001
		{x = 2150, y = 0, width = 1075, height = 657, offsetX = 0, offsetY = -2, offsetWidth = 1075, offsetHeight = 662}, -- 3: RacistDown0002
		{x = 3225, y = 0, width = 1075, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 662}, -- 4: RacistDown0003
		{x = 4300, y = 0, width = 1075, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 662}, -- 5: RacistDown0004
		{x = 5375, y = 0, width = 1075, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 662}, -- 6: RacistDown0005
		{x = 6450, y = 0, width = 1075, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 662}, -- 7: RacistDown0006
		{x = 0, y = 659, width = 1075, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 662}, -- 8: RacistDown0007
		{x = 1075, y = 659, width = 1075, height = 644, offsetX = 0, offsetY = -8, offsetWidth = 1075, offsetHeight = 652}, -- 9: RacistIdle0000
		{x = 2150, y = 659, width = 1075, height = 644, offsetX = 0, offsetY = -8, offsetWidth = 1075, offsetHeight = 652}, -- 10: RacistIdle0001
		{x = 3225, y = 659, width = 1075, height = 644, offsetX = 0, offsetY = -8, offsetWidth = 1075, offsetHeight = 652}, -- 11: RacistIdle0002
		{x = 4300, y = 659, width = 1075, height = 643, offsetX = 0, offsetY = -9, offsetWidth = 1075, offsetHeight = 652}, -- 12: RacistIdle0003
		{x = 5375, y = 659, width = 1075, height = 643, offsetX = 0, offsetY = -9, offsetWidth = 1075, offsetHeight = 652}, -- 13: RacistIdle0004
		{x = 6450, y = 659, width = 1075, height = 643, offsetX = 0, offsetY = -9, offsetWidth = 1075, offsetHeight = 652}, -- 14: RacistIdle0005
		{x = 0, y = 1318, width = 1075, height = 645, offsetX = 0, offsetY = -7, offsetWidth = 1075, offsetHeight = 652}, -- 15: RacistIdle0006
		{x = 1075, y = 1318, width = 1075, height = 645, offsetX = 0, offsetY = -7, offsetWidth = 1075, offsetHeight = 652}, -- 16: RacistIdle0007
		{x = 2150, y = 1318, width = 1075, height = 645, offsetX = 0, offsetY = -7, offsetWidth = 1075, offsetHeight = 652}, -- 17: RacistIdle0008
		{x = 3225, y = 1318, width = 1075, height = 651, offsetX = 0, offsetY = -1, offsetWidth = 1075, offsetHeight = 652}, -- 18: RacistIdle0009
		{x = 4300, y = 1318, width = 1075, height = 651, offsetX = 0, offsetY = -1, offsetWidth = 1075, offsetHeight = 652}, -- 19: RacistIdle0010
		{x = 5375, y = 1318, width = 1075, height = 652, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: RacistIdle0011
		{x = 6450, y = 1318, width = 1075, height = 652, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: RacistIdle0012
		{x = 0, y = 1970, width = 1075, height = 652, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: RacistIdle0013
		{x = 1075, y = 1970, width = 1075, height = 652, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: RacistIdle0014
		{x = 2150, y = 1970, width = 1075, height = 652, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: RacistIdle0015
		{x = 3225, y = 1970, width = 1091, height = 643, offsetX = 0, offsetY = -10, offsetWidth = 1091, offsetHeight = 653}, -- 25: RacistLeft0000
		{x = 4316, y = 1970, width = 1075, height = 652, offsetX = -12, offsetY = -1, offsetWidth = 1091, offsetHeight = 653}, -- 26: RacistLeft0001
		{x = 5391, y = 1970, width = 1075, height = 652, offsetX = -12, offsetY = -1, offsetWidth = 1091, offsetHeight = 653}, -- 27: RacistLeft0002
		{x = 6466, y = 1970, width = 1073, height = 653, offsetX = -13, offsetY = 0, offsetWidth = 1091, offsetHeight = 653}, -- 28: RacistLeft0003
		{x = 0, y = 2623, width = 1073, height = 653, offsetX = -13, offsetY = 0, offsetWidth = 1091, offsetHeight = 653}, -- 29: RacistLeft0004
		{x = 1073, y = 2623, width = 1073, height = 653, offsetX = -13, offsetY = 0, offsetWidth = 1091, offsetHeight = 653}, -- 30: RacistLeft0005
		{x = 2146, y = 2623, width = 1073, height = 653, offsetX = -13, offsetY = 0, offsetWidth = 1091, offsetHeight = 653}, -- 31: RacistLeft0006
		{x = 3219, y = 2623, width = 1056, height = 662, offsetX = -11, offsetY = -2, offsetWidth = 1077, offsetHeight = 664}, -- 32: RacistRight0000
		{x = 4275, y = 2623, width = 1075, height = 664, offsetX = -1, offsetY = 0, offsetWidth = 1077, offsetHeight = 664}, -- 33: RacistRight0001
		{x = 5350, y = 2623, width = 1075, height = 664, offsetX = -1, offsetY = 0, offsetWidth = 1077, offsetHeight = 664}, -- 34: RacistRight0002
		{x = 6425, y = 2623, width = 1077, height = 664, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 35: RacistRight0003
		{x = 0, y = 3287, width = 1077, height = 664, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 36: RacistRight0004
		{x = 1077, y = 3287, width = 1077, height = 664, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 37: RacistRight0005
		{x = 2154, y = 3287, width = 1077, height = 664, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 38: RacistRight0006
		{x = 3231, y = 3287, width = 1075, height = 719, offsetX = 0, offsetY = 0, offsetWidth = 1075, offsetHeight = 723}, -- 39: RacistUp0000
		{x = 4306, y = 3287, width = 1075, height = 697, offsetX = 0, offsetY = -26, offsetWidth = 1075, offsetHeight = 723}, -- 40: RacistUp0001
		{x = 5381, y = 3287, width = 1075, height = 697, offsetX = 0, offsetY = -26, offsetWidth = 1075, offsetHeight = 723}, -- 41: RacistUp0002
		{x = 6456, y = 3287, width = 1075, height = 695, offsetX = 0, offsetY = -28, offsetWidth = 1075, offsetHeight = 723}, -- 42: RacistUp0003
		{x = 0, y = 4006, width = 1075, height = 695, offsetX = 0, offsetY = -28, offsetWidth = 1075, offsetHeight = 723}, -- 43: RacistUp0004
		{x = 1075, y = 4006, width = 1075, height = 695, offsetX = 0, offsetY = -28, offsetWidth = 1075, offsetHeight = 723}, -- 44: RacistUp0005
		{x = 2150, y = 4006, width = 1075, height = 695, offsetX = 0, offsetY = -28, offsetWidth = 1075, offsetHeight = 723} -- 45: RacistUp0006
	},
	{
		["down"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0},
		["left"] = {start = 25, stop = 31, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 32, stop = 38, speed = 24, offsetX = 0, offsetY = 0},
		["up"] = {start = 39, stop = 45, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 9, stop = 24, speed = 30, offsetX = 0, offsetY = 0},
		["wahoo"] = {start = 77, stop = 120, speed = 30, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
