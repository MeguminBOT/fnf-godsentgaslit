--[[
>>> Toggleable Add Camera Zoom Event for Psych Engine. // AutisticLulu
>>> Triggers Add Camera Zoom events on every step.

Value 1:
	Parameters: "Stage Zoom, Hud Zoom"
	(Example: 0.015, 0.03)

Value 2:
	Parameters: [On/Off]
	(Example: On)
]]

-- Define local variables.
local isActive = false
local zoomValues = nil

-- This function is called when an event occurs.
function onEvent(name, value1, value2)
	if name == 'Toggle Zoom on Step' or name == 'Toggle_Zoom_on_Step' and cameraZoomOnBeat then
		zoomValues = value1
		if value2 == 'On' then
			isActive = true
		elseif value2 == 'Off' then
			isActive = false
		end
	end
end

function onStepHit()
	if isActive then
		local gameZoom, hudZoom = parseZoomValues(zoomValues)
		triggerEvent("Add Camera Zoom", gameZoom, hudZoom)
	end
end

-- Helper function: Parses the gameZoom and hudZoom values from the input string.
function parseZoomValues(value)
	return value:gsub(' ', ''):match('([^,]*),([^,]*)')
end
