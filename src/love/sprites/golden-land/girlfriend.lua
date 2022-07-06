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
	love.graphics.newImage(graphics.imagePath("golden-land/girlfriend")),
	-- Automatically generated from Mario_Phase2_GF_Assets_v1.xml
	{
		{x = 0, y = 0, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 1: GF Dancing Beat0000
		{x = 0, y = 0, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 2: GF Dancing Beat0001
		{x = 223, y = 0, width = 199, height = 219, offsetX = 0, offsetY = -5, offsetWidth = 199, offsetHeight = 224}, -- 3: GF Dancing Beat0002
		{x = 223, y = 0, width = 199, height = 219, offsetX = 0, offsetY = -5, offsetWidth = 199, offsetHeight = 224}, -- 4: GF Dancing Beat0003
		{x = 0, y = 247, width = 199, height = 219, offsetX = 0, offsetY = -5, offsetWidth = 199, offsetHeight = 224}, -- 5: GF Dancing Beat0004
		{x = 0, y = 247, width = 199, height = 219, offsetX = 0, offsetY = -5, offsetWidth = 199, offsetHeight = 224}, -- 6: GF Dancing Beat0005
		{x = 0, y = 247, width = 199, height = 219, offsetX = 0, offsetY = -5, offsetWidth = 199, offsetHeight = 224}, -- 7: GF Dancing Beat0006
		{x = 223, y = 247, width = 199, height = 224, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: GF Dancing Beat0007
		{x = 223, y = 247, width = 199, height = 224, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: GF Dancing Beat0008
		{x = 223, y = 247, width = 199, height = 224, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: GF Dancing Beat0009
		{x = 0, y = 495, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 11: GF Dancing Beat0010
		{x = 0, y = 495, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 12: GF Dancing Beat0011
		{x = 0, y = 495, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 13: GF Dancing Beat0012
		{x = 223, y = 495, width = 199, height = 221, offsetX = 0, offsetY = -3, offsetWidth = 199, offsetHeight = 224}, -- 14: GF Dancing Beat0013
		{x = 223, y = 495, width = 199, height = 221, offsetX = 0, offsetY = -3, offsetWidth = 199, offsetHeight = 224}, -- 15: GF Dancing Beat0014
		{x = 223, y = 495, width = 199, height = 221, offsetX = 0, offsetY = -3, offsetWidth = 199, offsetHeight = 224}, -- 16: GF Dancing Beat0015
		{x = 0, y = 742, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 17: GF Dancing Beat0016
		{x = 0, y = 742, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224}, -- 18: GF Dancing Beat0017
		{x = 0, y = 742, width = 199, height = 223, offsetX = 0, offsetY = -1, offsetWidth = 199, offsetHeight = 224} -- 19: GF Dancing Beat0018
	},
	{
		["idle"] = {start = 1, stop = 19, speed = 24, offsetX = 0, offsetY = 0},
		["sad"] = {start = 1, stop = 19, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
