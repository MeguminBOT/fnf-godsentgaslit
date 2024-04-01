-- This script made by BillyLOLwkwk
-- dont ever change this variable from path to cooldown
local path = ''
local scale = 0
local boyX = 0
local boyY = 0
local flipX = false 
local anim = {}
local x = 0
local ofs = {}
local fps = {}
local cooldown = {false, false, false, false}
local noAntialiasing = false
local tweenDirection = 'quadOut'

-- you can change this one to custom it yourself
local shadow = true -- true if you want turn on the shadow and false if you want turn it off
local range = 75 -- for the shadow range
local duration = 0.35 -- for how long the shadow still
local color = true
local hexColor = 'fc0303' -- color must be hex color

function startWith(text, prefix)
    return text:find(prefix,1,true) == 1
end

function updateShadow()
	-- don't be gay >:]
	path = getProperty('dad.imageFile')
	scale = getProperty('dad.jsonScale')
	boyX = getProperty('dad.x')
	boyY = getProperty('dad.y')
	flipX = getProperty('dad.originalFlipX') 
	for x = 0, getProperty('dad.animationsArray.length')-1 do
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singLEFT' then
			anim[1] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[1] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[2] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[1] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singDOWN' then
			anim[2] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[3] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[4] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[2] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singUP' then
			anim[3] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[5] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[6] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[3] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singRIGHT' then
			anim[4] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[7] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[8] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[4] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
	end
	noAntiliasing = getProperty('dad.noAntialiasing')
end
	

function onCreatePost()
	updateShadow()
end

function opponentNoteHit(a,b,c,d)
	if shadow and (d == false or (d == true and cooldown[b+1])) and c ~= 'GF Sing' then
	local tag = 'shadowdad'..tostring(x)
	makeAnimatedLuaSprite(tag, path, boyX, boyY)
	addAnimationByPrefix(tag, 'act', anim[b+1], fps[b+1], false)
	addLuaSprite(tag, false)
	setObjectOrder(tag, getObjectOrder('dadGroup')-1)
	doTweenAlpha(tag..'alpha', tag, 0, duration, tweenDirection)
	setProperty(tag..'.offset.x', ofs[b*2+1])
	setProperty(tag..'.offset.y', ofs[b*2+2])
	setProperty(tag..'.scale.x', scale)
	setProperty(tag..'.scale.y', scale)
	setProperty(tag..'.flipX', flipX)
	setProperty(tag..'.antialiasing', noAntialiasing)
	setBlendMode(tag, 'ADD')
	if color then
		doTweenColor(tag..'color', tag, hexColor,0.0000001, tweenDirection)
	end
	setProperty(tag..'.angle', getProperty('dad.angle'))
	objectPlayAnimation(tag, 'act', true)
	cooldown[b+1] = false
	if b == 0 then
		doTweenX(tag, tag, boyX - range, duration, tweenDirection)
		runTimer('dad_left', duration*2)
	end
	if b == 1 then
		doTweenY(tag, tag, boyY + range, duration, tweenDirection)
		runTimer('dad_down', duration*2)
	end
	if b == 2 then
		doTweenY(tag, tag, boyY - range, duration, tweenDirection)
		runTimer('dad_up', duration*2)
	end
	if b == 3 then
		doTweenX(tag, tag, boyX + range, duration, tweenDirection)
		runTimer('dad_right', duration*2)
	end
	x = x + 1
	end
end

function onTweenCompleted(tag)
	if startwith(tag, 'shadowdad') then
		removeLuaSprite(tag, true)
	end
end

function onTimerCompleted(tag)
	if tag == 'dad_left' then
		cooldown[1] = true
	end
	if tag == 'dad_down' then
		cooldown[2] = true
	end
	if tag == 'dad_up' then
		cooldown[3] = true
	end
	if tag == 'dad_right' then
		cooldown[4] = true
	end
end

function onEvent(n,v1,v2)
	if n == 'Edit Shadow Color' and v1 == 'dad' then
		if v2 == 'true' then
			color = true
		else
			color = false
		end
	end
	if n == 'Edit Shadow HexColor' and v1 == 'dad' then
		if v2 ~= '' then
		else
			hexColor = v2
		end
	end
	if n == "Edit Shadow" and v1 == 'dad' then
		if v2 == 'true' then
			shadow = true
		else
			shadow = false
		end
	end
	if n == 'Edit Shadow Range' and v1 == 'dad' then
		if tonumber(v2) > 0 then
			range = tonumber(v2)
		else
			range = 50
		end
	end
	if n == 'Edit Shadow Duration' and v1 == 'dad' then
		if tonumber(v2) > 0 then
			duration = tonumber(v2)
		else
			duration = 1
		end 		
	end
	if n == "Change Character" then
		updateShadow()
	end
end

