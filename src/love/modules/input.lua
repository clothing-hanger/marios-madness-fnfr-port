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

if settings.dfjk then
	if love.system.getOS() == "NX" then
		return baton.new {
			controls = {
				left = {"axis:leftx-", "button:dpleft", "key:left"},
				down = {"axis:lefty+", "button:dpdown", "key:down"},
				up = {"axis:lefty-", "button:dpup", "key:up"},
				right = {"axis:leftx+", "button:dpright", "key:right"},
				confirm = {"button:b", "key:return"},
				back = {"button:a", "key:escape"},
				simoc = {"key:s"},
				mechanicsInput = {"key:m"},
				dodge = {"key:space", "button:leftstick"},  -- do not use this one
				faceButtonDodge = {"key:space", "button:a", "button:b", "button:x", "button:y", "button:dpup", "button:dpdown", "button:dpleft", "button:dpright"},
				shoulderButtonDodge = {"key:space", "axis:triggerleft+", "button:leftshoulder", "axis:triggerright+", "button:rightshoulder"},
	
				gameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"},
				gameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "button:dpdown", "button:a", "key:f", "key:down"},
				gameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "button:dpup", "button:y", "key:j", "key:up"},
				gameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"},
				gameBack = {"button:start", "key:escape"},

				shoulderGameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "key:d", "key:left"},
				shoulderGameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "key:f", "key:down"},
				shoulderGameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "key:j", "key:up"},
				shoulderGameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "key:k", "key:right"},
				shoulderGameBack = {"button:start", "key:escape"},

				faceGameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"},
				faceGameDown = {"axis:lefty+", "axis:righty+", "button:dpdown", "button:a", "key:f", "key:down"},
				faceGameUp = {"axis:lefty-", "axis:righty-", "button:dpup", "button:y", "key:j", "key:up"},
				faceGameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"},
				faceGameBack = {"button:start", "key:escape"},
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	else
		return baton.new {
			controls = {
				left = {"key:left", "axis:leftx-", "button:dpleft"},
				down = {"key:down", "axis:lefty+", "button:dpdown"},
				up = {"key:up", "axis:lefty-", "button:dpup"},
				right = {"key:right", "axis:leftx+", "button:dpright"},
				confirm = {"key:return", "button:a"},
				back = {"key:escape", "button:b"},
				simoc = {"key:s"},
				mechanicsInput = {"key:m"},
				dodge = {"key:space", "button:leftstick"},
				faceButtonDodge = {"key:space", "button:a", "button:b", "button:x", "button:y", "button:dpup", "button:dpdown", "button:dpleft", "button:dpright"},
				shoulderButtonDodge  = {"key:space", "axis:triggerleft+", "button:leftshoulder", "axis:triggerright+", "button:rightshoulder"},
	
				gameLeft = {"key:d", "key:left", "axis:triggerleft+", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x"},
				gameDown = {"key:f", "key:down", "axis:lefty+", "axis:righty+", "button:leftshoulder", "button:dpdown", "button:a"},
				gameUp = {"key:j", "key:up", "axis:lefty-", "axis:righty-", "button:rightshoulder", "button:dpup", "button:y"},
				gameRight = {"key:k", "key:right", "axis:triggerright+", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b"},
				gameBack = {"key:escape", "button:start"},

				shoulderGameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "key:d", "key:left"},
				shoulderGameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "key:f", "key:down"},
				shoulderGameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "key:j", "key:up"},
				shoulderGameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "key:k", "key:right"},
				shoulderGameBack = {"button:start", "key:escape"},

				faceGameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"},
				faceGameDown = {"axis:lefty+", "axis:righty+", "button:dpdown", "button:a", "key:f", "key:down"},
				faceGameUp = {"axis:lefty-", "axis:righty-", "button:dpup", "button:y", "key:j", "key:up"},
				faceGameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"},
				faceGameBack = {"button:start", "key:escape"},
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	end
else
	if love.system.getOS() == "NX" then
		return baton.new {
			controls = {
				left = {"axis:leftx-", "button:dpleft", "key:left"},
				down = {"axis:lefty+", "button:dpdown", "key:down"},
				up = {"axis:lefty-", "button:dpup", "key:up"},
				right = {"axis:leftx+", "button:dpright", "key:right"},
				confirm = {"button:b", "key:return"},
				back = {"button:a", "key:escape"},
				simoc = {"key:s"},
				mechanicsInput = {"key:m"},
				dodge = {"key:space", "button:leftstick"},
				faceButtonDodge = {"key:space", "button:a", "button:b", "button:x", "button:y", "button:dpup", "button:dpdown", "button:dpleft", "button:dpright"},
				shoulderButtonDodge = {"key:space", "axis:triggerleft+", "button:leftshoulder", "axis:triggerright+", "button:rightshoulder"},
	
				gameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:a", "key:left"},
				gameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "button:dpdown", "button:a", "key:s", "key:down"},
				gameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "button:dpup", "button:y", "key:w", "key:up"},
				gameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:d", "key:right"},
				gameBack = {"button:start", "key:escape"},

				shoulderGameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "key:d", "key:left"},
				shoulderGameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "key:f", "key:down"},
				shoulderGameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "key:j", "key:up"},
				shoulderGameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "key:k", "key:right"},
				shoulderGameBack = {"button:start", "key:escape"},

				faceGameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"},
				faceGameDown = {"axis:lefty+", "axis:righty+", "button:dpdown", "button:a", "key:f", "key:down"},
				faceGameUp = {"axis:lefty-", "axis:righty-", "button:dpup", "button:y", "key:j", "key:up"},
				faceGameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"},
				faceGameBack = {"button:start", "key:escape"},
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	else
		return baton.new {
			controls = {
				left = {"key:left", "axis:leftx-", "button:dpleft"},
				down = {"key:down", "axis:lefty+", "button:dpdown"},
				up = {"key:up", "axis:lefty-", "button:dpup"},
				right = {"key:right", "axis:leftx+", "button:dpright"},
				confirm = {"key:return", "button:a"},
				back = {"key:escape", "button:b"},
				simoc = {"key:s"},
				mechanicsInput = {"key:m"},
				dodge = {"key:space", "button:leftstick"},
				faceButtonDodge = {"key:space", "button:a", "button:b", "button:x", "button:y", "button:dpup", "button:dpdown", "button:dpleft", "button:dpright"},
				shoulderButtonDodge = {"key:space", "axis:triggerleft+", "button:leftshoulder", "axis:triggerright+", "button:rightshoulder"},
	
				gameLeft = {"key:a", "key:left", "axis:triggerleft+", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x"},
				gameDown = {"key:s", "key:down", "axis:lefty+", "axis:righty+", "button:leftshoulder", "button:dpdown", "button:a"},
				gameUp = {"key:w", "key:up", "axis:lefty-", "axis:righty-", "button:rightshoulder", "button:dpup", "button:y"},
				gameRight = {"key:d", "key:right", "axis:triggerright+", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b"},
				gameBack = {"key:escape", "button:start"},

				shoulderGameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "key:d", "key:left"},
				shoulderGameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "key:f", "key:down"},
				shoulderGameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "key:j", "key:up"},
				shoulderGameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "key:k", "key:right"},
				shoulderGameBack = {"button:start", "key:escape"},

				faceGameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"},
				faceGameDown = {"axis:lefty+", "axis:righty+", "button:dpdown", "button:a", "key:f", "key:down"},
				faceGameUp = {"axis:lefty-", "axis:righty-", "button:dpup", "button:y", "key:j", "key:up"},
				faceGameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"},
				faceGameBack = {"button:start", "key:escape"},
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	end
end
