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
	love.graphics.newImage(graphics.imagePath("apparition/boyfriend")),
	-- Automatically generated from BoyFriend_Wario_Assets_v1.xml
	{
		{x = 0, y = 0, width = 319, height = 213, offsetX = 0, offsetY = -11, offsetWidth = 319, offsetHeight = 225}, -- 1: BF NOTE DOWN0000
		{x = 343, y = 0, width = 315, height = 224, offsetX = -3, offsetY = -1, offsetWidth = 319, offsetHeight = 225}, -- 2: BF NOTE DOWN0001
		{x = 343, y = 0, width = 315, height = 224, offsetX = -3, offsetY = -1, offsetWidth = 319, offsetHeight = 225}, -- 3: BF NOTE DOWN0002
		{x = 682, y = 0, width = 315, height = 224, offsetX = -3, offsetY = 0, offsetWidth = 319, offsetHeight = 225}, -- 4: BF NOTE DOWN0003
		{x = 682, y = 0, width = 315, height = 224, offsetX = -3, offsetY = 0, offsetWidth = 319, offsetHeight = 225}, -- 5: BF NOTE DOWN0004
		{x = 682, y = 0, width = 315, height = 224, offsetX = -3, offsetY = 0, offsetWidth = 319, offsetHeight = 225}, -- 6: BF NOTE DOWN0005
		{x = 682, y = 0, width = 315, height = 224, offsetX = -3, offsetY = 0, offsetWidth = 319, offsetHeight = 225}, -- 7: BF NOTE DOWN0006
		{x = 0, y = 248, width = 299, height = 237, offsetX = 0, offsetY = 0, offsetWidth = 319, offsetHeight = 237}, -- 8: BF NOTE LEFT0000
		{x = 323, y = 248, width = 305, height = 224, offsetX = -13, offsetY = -5, offsetWidth = 319, offsetHeight = 237}, -- 9: BF NOTE LEFT0001
		{x = 323, y = 248, width = 305, height = 224, offsetX = -13, offsetY = -5, offsetWidth = 319, offsetHeight = 237}, -- 10: BF NOTE LEFT0002
		{x = 652, y = 248, width = 305, height = 224, offsetX = -14, offsetY = -6, offsetWidth = 319, offsetHeight = 237}, -- 11: BF NOTE LEFT0003
		{x = 652, y = 248, width = 305, height = 224, offsetX = -14, offsetY = -6, offsetWidth = 319, offsetHeight = 237}, -- 12: BF NOTE LEFT0004
		{x = 652, y = 248, width = 305, height = 224, offsetX = -14, offsetY = -6, offsetWidth = 319, offsetHeight = 237}, -- 13: BF NOTE LEFT0005
		{x = 652, y = 248, width = 305, height = 224, offsetX = -14, offsetY = -6, offsetWidth = 319, offsetHeight = 237}, -- 14: BF NOTE LEFT0006
		{x = 0, y = 509, width = 294, height = 244, offsetX = -18, offsetY = 0, offsetWidth = 312, offsetHeight = 244}, -- 15: BF NOTE RIGHT0000
		{x = 318, y = 509, width = 299, height = 235, offsetX = -1, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 16: BF NOTE RIGHT0001
		{x = 318, y = 509, width = 299, height = 235, offsetX = -1, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 17: BF NOTE RIGHT0002
		{x = 641, y = 509, width = 299, height = 235, offsetX = 0, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 18: BF NOTE RIGHT0003
		{x = 641, y = 509, width = 299, height = 235, offsetX = 0, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 19: BF NOTE RIGHT0004
		{x = 641, y = 509, width = 299, height = 235, offsetX = 0, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 20: BF NOTE RIGHT0005
		{x = 641, y = 509, width = 299, height = 235, offsetX = 0, offsetY = -5, offsetWidth = 312, offsetHeight = 244}, -- 21: BF NOTE RIGHT0006
		{x = 0, y = 777, width = 316, height = 241, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: BF NOTE UP0000
		{x = 340, y = 777, width = 316, height = 230, offsetX = 0, offsetY = -8, offsetWidth = 316, offsetHeight = 241}, -- 23: BF NOTE UP0001
		{x = 340, y = 777, width = 316, height = 230, offsetX = 0, offsetY = -8, offsetWidth = 316, offsetHeight = 241}, -- 24: BF NOTE UP0002
		{x = 680, y = 777, width = 316, height = 228, offsetX = 0, offsetY = -9, offsetWidth = 316, offsetHeight = 241}, -- 25: BF NOTE UP0003
		{x = 680, y = 777, width = 316, height = 228, offsetX = 0, offsetY = -9, offsetWidth = 316, offsetHeight = 241}, -- 26: BF NOTE UP0004
		{x = 680, y = 777, width = 316, height = 228, offsetX = 0, offsetY = -9, offsetWidth = 316, offsetHeight = 241}, -- 27: BF NOTE UP0005
		{x = 680, y = 777, width = 316, height = 228, offsetX = 0, offsetY = -9, offsetWidth = 316, offsetHeight = 241}, -- 28: BF NOTE UP0006
		{x = 0, y = 1042, width = 315, height = 205, offsetX = -5, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 29: BF idle dance0000
		{x = 0, y = 1042, width = 315, height = 205, offsetX = -5, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 30: BF idle dance0001
		{x = 339, y = 1042, width = 310, height = 217, offsetX = -10, offsetY = 0, offsetWidth = 320, offsetHeight = 217}, -- 31: BF idle dance0002
		{x = 339, y = 1042, width = 310, height = 217, offsetX = -10, offsetY = 0, offsetWidth = 320, offsetHeight = 217}, -- 32: BF idle dance0003
		{x = 673, y = 1042, width = 315, height = 206, offsetX = -5, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 33: BF idle dance0004
		{x = 673, y = 1042, width = 315, height = 206, offsetX = -5, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 34: BF idle dance0005
		{x = 0, y = 1283, width = 316, height = 204, offsetX = -4, offsetY = -2, offsetWidth = 320, offsetHeight = 217}, -- 35: BF idle dance0006
		{x = 0, y = 1283, width = 316, height = 204, offsetX = -4, offsetY = -2, offsetWidth = 320, offsetHeight = 217}, -- 36: BF idle dance0007
		{x = 340, y = 1283, width = 319, height = 200, offsetX = 0, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 37: BF idle dance0008
		{x = 683, y = 1283, width = 319, height = 200, offsetX = 0, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 38: BF idle dance0009
		{x = 0, y = 1511, width = 317, height = 203, offsetX = -3, offsetY = -1, offsetWidth = 320, offsetHeight = 217}, -- 39: BF idle dance0010
		{x = 0, y = 1511, width = 317, height = 203, offsetX = -3, offsetY = -1, offsetWidth = 320, offsetHeight = 217} -- 40: BF idle dance0011
	},
	{
		["down"] = {start = 1, stop = 7, speed = 24, offsetX = 0, offsetY = 0},
		["miss down"] = {start = 1, stop = 7, speed = 24, offsetX = 0, offsetY = 0},
		["left"] = {start = 8, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["miss left"] = {start = 8, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 15, stop = 21, speed = 24, offsetX = 0, offsetY = 0},
		["miss right"] = {start = 15, stop = 21, speed = 24, offsetX = 0, offsetY = 0},
		["up"] = {start = 22, stop = 28, speed = 24, offsetX = 0, offsetY = 0},
		["miss up"] = {start = 22, stop = 28, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 29, stop = 40, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
