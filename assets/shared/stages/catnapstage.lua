-- Using Lulu's optimizations to avoid game lagging.

function onCreate()
	-- Custom functions for stage.
	createStage() -- Create stages.
	createStageAnimated() -- Create animated stages.
	createMiscSprites() -- Create misc sprites.
end

function createStage()
	local stages = {
		{ name = 'bg', image = 'BGs/bg', posX = -1499, posY = -1003, scrollX = 1, scrollY = 1, scaleX = 1.1, scaleY = 1.1, add = false },
		{ name = 'bg3', image = 'BGs/bg3', posX = -1500, posY = -1900, scrollX = 0.2, scrollY = 0.2, scaleX = 1.1, scaleY = 1.1, add = true },
        { name = 'bg4', image = 'BGs/bg4', posX = -564, posY = -299, scrollX = 0.4, scrollY = 0.4, scaleX = 2.2, scaleY = 2.2, add = true },
        { name = 'bg5', image = 'BGs/bg5', posX = -1515, posY = -900, scrollX = 0.8, scrollY = 0.8, scaleX = 1.2, scaleY = 1.2, add = true },
        { name = 'FinalBG1', image = 'BGs/FinalBG1', posX = -1095, posY = -123, scrollX = 1, scrollY = 1, scaleX = 0.8, scaleY = 0.8, add = true },
        { name = 'FinalBG2', image = 'BGs/FinalBG2', posX = -1095, posY = -123, scrollX = 1, scrollY = 1, scaleX = 0.8, scaleY = 0.8, add = true },
        { name = 'FinalBG3', image = 'BGs/FinalBG3', posX = -1095, posY = -123, scrollX = 1, scrollY = 1, scaleX = 0.8, scaleY = 0.8, add = true },
        { name = 'FinalBG4', image = 'BGs/FinalBG4', posX = -1095, posY = -123, scrollX = 1, scrollY = 1, scaleX = 0.8, scaleY = 0.8, add = true },
        { name = 'floor', image = 'BGs/elevatorfloor', posX = -116, posY = 491, scrollX = 1.1, scrollY = 1.1, scaleX = 0.7, scaleY = 0.7, add = true },
        { name = 'fog1', image = 'BGs/fog1', posX = 2720, posY = 325, scrollX = 1, scrollY = 1, scaleX = 1.1, scaleY = 1.1, add = true },
		{ name = 'fog2', image = 'BGs/fog2', posX = -5099, posY = 181, scrollX = 1.3, scrollY = 1.3, scaleX = 1.4, scaleY = 1.4, add = true },
		{ name = 'fog3', image = 'BGs/fog3', posX = -5653, posY = 0, scrollX = 0.8, scrollY = 0.8, scaleX = 1.4, scaleY = 1.4, add = true },
		{ name = 'fog4', image = 'BGs/fog4', posX = -1639, posY = -456, scrollX = 1, scrollY = 1, scaleX = 1.5, scaleY = 1.5, add = true },
	}
	
	for _, stage in ipairs(stages) do
		precacheImage(stage.image)
		makeLuaSprite(stage.name, stage.image, stage.posX, stage.posY)
		setScrollFactor(stage.name, stage.scrollX, stage.scrollY)
		scaleObject(stage.name, stage.scaleX, stage.scaleY)
		addLuaSprite(stage.name, stage.add)
		setProperty(stage.name .. '.visible', false)
	end

    setProperty('bg.visible', true)
    setProperty('fog1.visible', true)
    setProperty('fog2.visible', true)
    setProperty('fog3.visible', true)
    setProperty('fog4.visible', true)
    setProperty('fog1.alpha', 0)
	setProperty('fog2.alpha', 0.7)
	setProperty('fog3.alpha', 0.9)
	setProperty('fog4.alpha', 0)

    setObjectOrder('bg', 0)
    setObjectOrder('fog1', 4)
    setObjectOrder('fog2', 8)
    setObjectOrder('fog3', 1)
    setObjectOrder('fog4', 10)
end

function createStageAnimated()
	local stagesAnimated = {
		{ name = 'lightning', image = 'lightning', animation = 'anim', xmlPrefix = 'idle', fps = 24, loop = true, posX = 580, posY = 0, scrollX = 0, scrollY = 0, scaleX = 0.5, scaleY = 0.5, add = true },
        { name = 'body', image = 'catnapbody', animation = 'anim', xmlPrefix = 'idle', fps = 24, loop = true, posX = 95, posY = -43, scrollX = 1, scrollY = 1, scaleX = 1.1, scaleY = 1.1, add = true },
        { name = 'elevator', image = 'BGs/elevator', animation = 'anim', xmlPrefix = 'idle', fps = 24, loop = true, posX = -179, posY = -107, scrollX = 1, scrollY = 1, scaleX = 1.2, scaleY = 1.2, add = true },
        { name = 'grid', image = 'BGs/grid', animation = 'anim', xmlPrefix = 'idle', fps = 24, loop = true, posX = -1925, posY = -717, scrollX = 0.1, scrollY = 0.1, scaleX = 2.4, scaleY = 2.4, add = true },
        { name = 'tv', image = 'tv', fps = 24, loop = true, posX = 853, posY = -490, scrollX = 1, scrollY = 1, scaleX = 1.5, scaleY = 1.5, add = true },
    }

	for _, stage in ipairs(stagesAnimated) do
		precacheImage(stage.image)
		makeAnimatedLuaSprite(stage.name, stage.image, stage.posX, stage.posY)
		setScrollFactor(stage.name, stage.scrollX, stage.scrollY)

        if (stage.name == 'tv') then
		    addAnimationByPrefix(stage.name, 'idle', 'idle', stage.fps, stage.loop)
            addAnimationByPrefix(stage.name, 'sing', 'sing', stage.fps, stage.loop)
        else
            addAnimationByPrefix(stage.name, stage.animation, stage.xmlPrefix, stage.fps, stage.loop)
        end
        
		scaleObject(stage.name, stage.scaleX, stage.scaleY)
		addLuaSprite(stage.name, stage.add)
		setProperty(stage.name .. '.visible', false)
	end

	setProperty('grid.alpha', 0.3)
    setObjectOrder('lightning', 10)
end

function createMiscSprites()
	local miscSprites = {
		{ name = 'bedtime', image = 'bedtime', camera = 'camHUD', posX = 0, posY = 0, scrollX = 1, scrollY = 1, scaleX = 1, scaleY = 1, alpha = 0 },
		{ name = 'uithing', image = 'uithing', camera = 'camHUD', posX = 0, posY = 0, scrollX = 1, scrollY = 1, scaleX = 1, scaleY = 1, alpha = 0 },
		{ name = 'white', image = 'white', camera = 'camOther', posX = 0, posY = 0, scrollX = 1, scrollY = 1, scaleX = 1, scaleY = 1, alpha = 1 },
		{ name = 'black', image = 'black', camera = 'camOther', posX = 0, posY = 0, scrollX = 1, scrollY = 1, scaleX = 1, scaleY = 1, alpha = 1 },	}

	for _, miscSprite in ipairs(miscSprites) do
		precacheImage(miscSprite.image)
		makeLuaSprite(miscSprite.name, miscSprite.image, miscSprite.posX, miscSprite.posY)
		setScrollFactor(miscSprite.name, miscSprite.scrollX, miscSprite.scrollY)
		scaleObject(miscSprite.name, miscSprite.scaleX, miscSprite.scaleX)
		setObjectCamera(miscSprite.name, miscSprite.camera)
		addLuaSprite(miscSprite.name, true)
		setProperty(miscSprite.name .. '.alpha', miscSprite.alpha)
	end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if curStep >= 1695 and curStep <= 2432 then
		playAnim('tv', 'sing', true)
		if getProperty('tv.animation.curAnim.finished') then
			playAnim('tv', 'idle', false)
		end
	end
end

function onBeatHit()
	if curBeat >= 0 and curBeat <= 16 then
        setProperty('canPause', false)
    elseif curBeat >= 304 and curBeat <= 328 then
		setProperty('canPause', false)
    elseif curBeat >= 408 and curBeat <= 432 then
		setProperty('canPause', false)
    elseif curBeat >= 580 and curBeat <= 612 then
		setProperty('canPause', false)
    elseif curBeat >= 738 and curBeat <= 748 then
		setProperty('canPause', false)
    elseif curBeat >= 952 and curBeat <= 1034 then
		setProperty('canPause', false)
    else
		setProperty('canPause', true)
    end
end

function onStepHit()
	if curStep == 64 then
		doTweenX('fog3', 'fog3', 2000, 30, 'linear')

	elseif curStep == 100 then
        doTweenX('fog1', 'fog1', -5000, 50, 'linear')

    elseif curStep == 592 then
        setProperty('boyfriendGroup.visible', false)
        setProperty('lightning.visible', true)
		setProperty('bf2.alpha', 1)
		setProperty('catnap2.alpha', 1)

	elseif curStep == 832 then
        removeLuaSprite('lightning', true)
		removeLuaSprite('bf2', true)
		removeLuaSprite('catnap2', true)

        setProperty('boyfriendGroup.visible', true)

		doTweenX('fog2', 'fog2', 2000, 30, 'linear')

	elseif curStep == 1232 then
        removeLuaSprite('bg', true)
		removeLuaSprite('fog1', true)
		removeLuaSprite('fog2', true)
		removeLuaSprite('fog3', true)
		removeLuaSprite('fog4', true)
		removeLuaSprite('fog5', true)

		setProperty('bg3.visible', true)
        setProperty('elevator.visible', true)
        setProperty('floor.visible', true)
        setProperty('body.visible', true)

        setObjectOrder('body', 1)
        setObjectOrder('elevator', 9)
        setObjectOrder('bg3', 0)
        setObjectOrder('dadGroup', 3)
        setObjectOrder('floor', 12)

        playAnim('body', 'anim', true)
        playAnim('elevator', 'anim', true)

	elseif curStep == 1312 then
		doTweenY('bg3', 'bg3', 0, 20, 'linear')

	elseif curStep == 1696 then
        removeLuaSprite('bg3', true)
        removeLuaSprite('body', true)
        removeLuaSprite('elevator', true)
        removeLuaSprite('floor', true)

		setProperty('bg4.visible', true)
        setProperty('grid.visible', true)
        setProperty('tv.visible', true)
        setProperty('uithing.alpha', 1)

        setObjectOrder('bg4', 0)
        setObjectOrder('grid', 1)
        setObjectOrder('tv', 2)

        doTweenY('bg4Y', 'bg4', -3000, 43, 'linear')
		doTweenX('bg4X', 'bg4', -6000, 43, 'linear')

        playAnim('tv', 'idle', true)

	elseif curStep == 2432 then
        removeLuaSprite('bg4', true)
		removeLuaSprite('grid', true)
		removeLuaSprite('tv', true)
		removeLuaSprite('uithing', true)

        setProperty('bg5.visible', true)

        setObjectOrder('bg5', 0)

	elseif curStep == 2992 then
		removeLuaSprite('bg5', true)

        setProperty('FinalBG1.visible', true)
        setProperty('FinalBG2.visible', true)
        setProperty('FinalBG3.visible', true)
        setProperty('FinalBG4.visible', true)

        setObjectOrder('FinalBG1', 0)
        setObjectOrder('FinalBG2', 3)
        setObjectOrder('dadGroup', 6)
        setObjectOrder('FinalBG3', 10)
        setObjectOrder('FinalBG4', 10)
	end
end