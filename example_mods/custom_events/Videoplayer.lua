function onEvent(name, value1, value2)
    if name == 'Videoplayer' then
        if value2 == 'true' then
            startVideo(value1, true, false)      
        elseif value2 == 'false' then
            startVideo(value1, false, false)
        end
        setProperty('inCutscene', false)
    end
end