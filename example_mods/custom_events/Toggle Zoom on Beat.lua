--[[
>>> Toggleable Add Camera Zoom Event for Psych Engine. // AutisticLulu
	Triggers Add Camera Zoom events on every beat or optionally between a set amount of beats.
	
	Confirmed compatible Psych Engine Versions:
	0.6.x, 0.7.1, 0.7.2

Value 1:
    Parameters: "Stage Zoom, Hud Zoom, Number of beats *OPTIONAL*"
    (Example: 0.015, 0.03)
    (Example: 0.015, 0.03, 2)

Value 2:
    Parameters: [On/Off]
    (Example: On)
]]

-- Define local variables.
local isActive = false
local gameZoom, hudZoom, numBeats = nil, nil, nil
local beatTrigger = 1
local beatCount = 0

-- Helper function: Parses the gameZoom, hudZoom, and numBeats.
local function parseZoomValues(value)
    return value:match('([^,]+),%s*([^,]+),?%s*([^,]*)')
end

function onEvent(name, value1, value2)
    if (name == 'Toggle Zoom on Beat' or name == 'Toggle_Zoom_on_Beat') and cameraZoomOnBeat then
        gameZoom, hudZoom, numBeats = parseZoomValues(value1)
        
        beatTrigger = tonumber(numBeats) or 1 -- Default to 1 if not specified or invalid
        isActive = (value2 == 'On')
    end
end

function onBeatHit()
    beatCount = beatCount + 1
    if isActive and beatCount % beatTrigger == 0 and gameZoom and hudZoom then
        triggerEvent("Add Camera Zoom", gameZoom, hudZoom)
    end
end
