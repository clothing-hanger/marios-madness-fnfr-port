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
	love.graphics.newImage(graphics.imagePath("racetraitors/boyfriend")),
	-- Automatically generated from bf.xml
	{
		{x = 0, y = 0, width = 1077, height = 604, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 632}, -- 1: RaceDown0000
		{x = 1101, y = 0, width = 1077, height = 625, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 632}, -- 2: RaceDown0001
		{x = 1101, y = 0, width = 1077, height = 625, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 632}, -- 3: RaceDown0002
		{x = 2202, y = 0, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 4: RaceDown0003
		{x = 2202, y = 0, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 5: RaceDown0004
		{x = 2202, y = 0, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 6: RaceDown0005
		{x = 2202, y = 0, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 7: RaceDown0006
		{x = 0, y = 0, width = 1077, height = 604, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 632}, -- 8: BFDownMiss0000
		{x = 0, y = 650, width = 1077, height = 625, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 632}, -- 9: BFDownMiss0001
		{x = 0, y = 650, width = 1077, height = 625, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 632}, -- 10: BFDownMiss0002
		{x = 1101, y = 650, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 11: BFDownMiss0003
		{x = 1101, y = 650, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 12: BFDownMiss0004
		{x = 1101, y = 650, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 13: BFDownMiss0005
		{x = 1101, y = 650, width = 1077, height = 626, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 632}, -- 14: BFDownMiss0006
		{x = 2202, y = 650, width = 1077, height = 645, offsetX = 0, offsetY = -14, offsetWidth = 1077, offsetHeight = 659}, -- 15: BFIdle0000
		{x = 2202, y = 650, width = 1077, height = 645, offsetX = 0, offsetY = -14, offsetWidth = 1077, offsetHeight = 659}, -- 16: BFIdle0001
		{x = 2202, y = 650, width = 1077, height = 645, offsetX = 0, offsetY = -14, offsetWidth = 1077, offsetHeight = 659}, -- 17: BFIdle0002
		{x = 0, y = 1319, width = 1077, height = 644, offsetX = 0, offsetY = -15, offsetWidth = 1077, offsetHeight = 659}, -- 18: BFIdle0003
		{x = 0, y = 1319, width = 1077, height = 644, offsetX = 0, offsetY = -15, offsetWidth = 1077, offsetHeight = 659}, -- 19: BFIdle0004
		{x = 0, y = 1319, width = 1077, height = 644, offsetX = 0, offsetY = -15, offsetWidth = 1077, offsetHeight = 659}, -- 20: BFIdle0005
		{x = 1101, y = 1319, width = 1077, height = 646, offsetX = 0, offsetY = -13, offsetWidth = 1077, offsetHeight = 659}, -- 21: BFIdle0006
		{x = 1101, y = 1319, width = 1077, height = 646, offsetX = 0, offsetY = -13, offsetWidth = 1077, offsetHeight = 659}, -- 22: BFIdle0007
		{x = 1101, y = 1319, width = 1077, height = 646, offsetX = 0, offsetY = -13, offsetWidth = 1077, offsetHeight = 659}, -- 23: BFIdle0008
		{x = 2202, y = 1319, width = 1077, height = 656, offsetX = 0, offsetY = -3, offsetWidth = 1077, offsetHeight = 659}, -- 24: BFIdle0009
		{x = 2202, y = 1319, width = 1077, height = 656, offsetX = 0, offsetY = -3, offsetWidth = 1077, offsetHeight = 659}, -- 25: BFIdle0010
		{x = 0, y = 1999, width = 1077, height = 658, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 659}, -- 26: BFIdle0011
		{x = 0, y = 1999, width = 1077, height = 658, offsetX = 0, offsetY = -1, offsetWidth = 1077, offsetHeight = 659}, -- 27: BFIdle0012
		{x = 1101, y = 1999, width = 1077, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 28: BFIdle0013
		{x = 1101, y = 1999, width = 1077, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 29: BFIdle0014
		{x = 1101, y = 1999, width = 1077, height = 659, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 30: BFIdle0015
		{x = 1103, y = 2682, width = 1045, height = 654, offsetX = -13, offsetY = 0, offsetWidth = 1079, offsetHeight = 654}, -- 31: RaceLeft0000
		{x = 2202, y = 1999, width = 1077, height = 652, offsetX = -1, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 32: RaceLeft0001
		{x = 2202, y = 1999, width = 1077, height = 652, offsetX = -1, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 33: RaceLeft0002
		{x = 0, y = 2682, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 34: RaceLeft0003
		{x = 0, y = 2682, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 35: RaceLeft0004
		{x = 0, y = 2682, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 36: RaceLeft0005
		{x = 0, y = 2682, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 37: RaceLeft0006
		{x = 1103, y = 2682, width = 1045, height = 654, offsetX = -13, offsetY = 0, offsetWidth = 1079, offsetHeight = 654}, -- 38: BFLeftMiss0000
		{x = 2172, y = 2682, width = 1077, height = 652, offsetX = -1, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 39: BFLeftMiss0001
		{x = 2172, y = 2682, width = 1077, height = 652, offsetX = -1, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 40: BFLeftMiss0002
		{x = 0, y = 3360, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 41: BFLeftMiss0003
		{x = 0, y = 3360, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 42: BFLeftMiss0004
		{x = 0, y = 3360, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 43: BFLeftMiss0005
		{x = 0, y = 3360, width = 1079, height = 652, offsetX = 0, offsetY = -2, offsetWidth = 1079, offsetHeight = 654}, -- 44: BFLeftMiss0006
		{x = 1103, y = 3360, width = 1100, height = 641, offsetX = 0, offsetY = -11, offsetWidth = 1100, offsetHeight = 652}, -- 45: RaceRight0000
		{x = 2227, y = 3360, width = 1077, height = 652, offsetX = -13, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 46: RaceRight0001
		{x = 2227, y = 3360, width = 1077, height = 652, offsetX = -13, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 47: RaceRight0002
		{x = 0, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 48: RaceRight0003
		{x = 0, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 49: RaceRight0004
		{x = 0, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 50: RaceRight0005
		{x = 0, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 51: RaceRight0006
		{x = 0, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 52: RaceRight0007
		{x = 1103, y = 3360, width = 1100, height = 641, offsetX = 0, offsetY = -11, offsetWidth = 1100, offsetHeight = 652}, -- 53: BFRightMiss0000
		{x = 1099, y = 4036, width = 1077, height = 652, offsetX = -13, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 54: BFRightMiss0001
		{x = 1099, y = 4036, width = 1077, height = 652, offsetX = -13, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 55: BFRightMiss0002
		{x = 2200, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 56: BFRightMiss0003
		{x = 2200, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 57: BFRightMiss0004
		{x = 2200, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 58: BFRightMiss0005
		{x = 2200, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 59: BFRightMiss0006
		{x = 2200, y = 4036, width = 1075, height = 652, offsetX = -14, offsetY = 0, offsetWidth = 1100, offsetHeight = 652}, -- 60: BFRightMiss0007
		{x = 0, y = 4712, width = 1077, height = 699, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 704}, -- 61: RaceUp0000
		{x = 1101, y = 4712, width = 1077, height = 678, offsetX = 0, offsetY = -26, offsetWidth = 1077, offsetHeight = 704}, -- 62: RaceUp0001
		{x = 1101, y = 4712, width = 1077, height = 678, offsetX = 0, offsetY = -26, offsetWidth = 1077, offsetHeight = 704}, -- 63: RaceUp0002
		{x = 2202, y = 4712, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 64: RaceUp0003
		{x = 2202, y = 4712, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 65: RaceUp0004
		{x = 2202, y = 4712, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 66: RaceUp0005
		{x = 2202, y = 4712, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 67: RaceUp0006
		{x = 0, y = 4712, width = 1077, height = 699, offsetX = 0, offsetY = 0, offsetWidth = 1077, offsetHeight = 704}, -- 68: BFUpMiss0000
		{x = 0, y = 5435, width = 1077, height = 678, offsetX = 0, offsetY = -26, offsetWidth = 1077, offsetHeight = 704}, -- 69: BFUpMiss0001
		{x = 0, y = 5435, width = 1077, height = 678, offsetX = 0, offsetY = -26, offsetWidth = 1077, offsetHeight = 704}, -- 70: BFUpMiss0002
		{x = 1101, y = 5435, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 71: BFUpMiss0003
		{x = 1101, y = 5435, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 72: BFUpMiss0004
		{x = 1101, y = 5435, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704}, -- 73: BFUpMiss0005
		{x = 1101, y = 5435, width = 1077, height = 676, offsetX = 0, offsetY = -28, offsetWidth = 1077, offsetHeight = 704} -- 74: BFUpMiss0006
	},
	{
		["dead"] = {start = 1, stop = 34, speed = 24, offsetX = 0, offsetY = 0},
		["dead confirm"] = {start = 35, stop = 68, speed = 24, offsetX = 0, offsetY = 0},
		["hey"] = {start = 6, stop = 9, speed = 24, offsetX = 0, offsetY = 0},
		["down"] = {start = 1, stop = 7, speed = 24, offsetX = 0, offsetY = 0},
		["miss down"] = {start = 8, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["left"] = {start = 31, stop = 37, speed = 24, offsetX = 0, offsetY = 0},
		["miss left"] = {start = 38, stop = 44, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 45, stop = 52, speed = 24, offsetX = 0, offsetY = 0},
		["miss right"] = {start = 53, stop = 60, speed = 24, offsetX = 0, offsetY = 0},
		["up"] = {start = 61, stop = 67, speed = 24, offsetX = 0, offsetY = 0},
		["miss up"] = {start = 68, stop = 74, speed = 24, offsetX = 0, offsetY = 0},
		["dies"] = {start = 3, stop = 4, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 15, stop = 30, speed = 24, offsetX = 0, offsetY = 0},
		["shaking"] = {start = 4, stop = 4, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
