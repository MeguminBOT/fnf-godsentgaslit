local Text = {
   enabled = true, -- Adds the Combo Text
   font = 'vcr.ttf', -- Font
   alpha = 1, -- Opacity
   x = 10, -- X of text
   y = 300, -- Y of Text
   Allignment = 'left', -- side
   Size = 20, -- Size of Text
   tweens = true, -- If disabled then will only change colors instanly -- Kinda Breaks
   ease = 'ExpoOut' -- For Tweens
}
local Colors = { -- Default Colors
   SickColor = 'FFFFFF',
   GoodColor = 'FFFFFF',
   BadColor = 'FFFFFF',
   ShitColor = 'FFFFFF',
   MissColor = 'FFFFFF',
   ColorCobo = 'FFFFFF',
   maxcobo = 'FFFFFF'
}
local FcColors = { -- If you Combo the Colors will Change to this
   enabled = true, -- If False then will only be DEFAULT COLOR
   SickColor = 'd1bd58',
   GoodColor = 'd1bd58',
   BadColor = 'd1bd58',
   ShitColor = 'd1bd58',
   MissColor = 'd1bd58',
   ColorCobo = 'd1bd58',
   maxcobo = 'd1bd58'
}
local PfcColors = { -- If you Combo the Colors will Change to this
   enabled = true, -- If False then will only be DEFAULT COLOR
   SickColor = 'A020F0',
   GoodColor = 'A020F0',
   BadColor = 'A020F0',
   ShitColor = 'A020F0',
   MissColor = 'A020F0',
   ColorCobo = 'A020F0',
   maxcobo = 'A020F0'
}














if Text.enabled == true then
   maxcombo = 0
   x = Text.x
   y = Text.y
   side = Text.Allignment
function onCreate()
     setProperty('scoreTxt.visible', false)
     makeLuaText('accuracy', 'Accuracy: ???', 350, 20, 600)
     makeLuaText('maxcobo', 'Max Combo: 0', 330, 20, 609 + Text.Size)
     makeLuaText('cobo', 'Combo: 0', 300, 20, 618 + Text.Size*2)
     makeLuaText('misst', 'Misses: 0', 300, 20, 549 + Text.Size*7)
     addLuaText('accuracy', true)
     addLuaText('maxcobo', true)
     addLuaText('misst', true)
     addLuaText('cobo', true)
     setTextAlignment('accuracy', side)
     setTextAlignment('maxcobo', side)
     setTextAlignment('misst', side)
     setTextAlignment('cobo', side)
     setProperty('accuracy.alpha', Text.alpha)
     setProperty('maxcobo.alpha', Text.alpha)
     setProperty('misst.alpha', Text.alpha)
     setProperty('cobo.alpha', Text.alpha)
     setTextSize('accuracy', Text.Size)
     setTextSize('maxcobo', Text.Size)
     setTextSize('misst', Text.Size)
     setTextSize('cobo', Text.Size)
     setTextColor('accuracy', Colors.SickColor)
     setTextColor('maxcobo', Colors.SickColor)
     setTextColor('misst', Colors.MissColor)
     setTextColor('cobo', Colors.ColorCobo)
     setTextFont('accuracy', Text.font)
     setTextFont('maxcobo', Text.font)
     setTextFont('misst', Text.font)
     setTextFont('cobo', Text.font)

end
function goodNoteHit()
   if maxcombo <  getProperty('combo') then maxcombo = getProperty('combo') end
   setTextString('accuracy', 'Accuracy: ' .. math.floor( rating * 10000) * 0.01 .. ' [' .. ratingName .. ']')
   setTextString('maxcobo', 'Max Combo: ' .. maxcombo)
    setTextString('cobo', 'Combo: ' .. getProperty('combo'))

          --All the IF THENs
          
  if rating == 1 and misses == 0 then
   if Text.tweens == false then
      setTextColor('accuracy', PfcColors.SickColor)
      setTextColor('maxcobo', PfcColors.SickColor)
      setTextColor('misst', PfcColors.MissColor)
      setTextColor('cobo', PfcColors.ColorCobo)
   elseif Text.tweens == true then
      doTweenColor('PFCH', 'accuracy', PfcColors.SickColor, 0.1, Text.ease)
      doTweenColor('PFCaH', 'maxcobo', PfcColors.SickColor, 0.1, Text.ease)
      doTweenColor('PFCM', 'misst', PfcColors.MissColor, 0.1, Text.ease)
      doTweenColor('PFCN', 'cobo', PfcColors.ColorCobo, 0.1, Text.ease)
   end

 elseif misses == 0 and rating ~= 1 then
   if Text.tweens == false then
    setTextColor('accuracy', FcColors.SickColor)
    setTextColor('maxcobo', FcColors.SickColor)
    setTextColor('misst', FcColors.MissColor)
    setTextColor('cobo', FcColors.ColorCobo)
   elseif Text.tweens == true then
      doTweenColor('dA', 'accuracy', FcColors.SickColor, 0.1, Text.ease)
      doTweenColor('dA1', 'maxcobo', FcColors.SickColor, 0.1, Text.ease)
      doTweenColor('dF', 'misst', FcColors.MissColor, 0.1, Text.ease)
      doTweenColor('sdG', 'cobo', FcColors.ColorCobo, 0.1, Text.ease)
   end
  

 
end
end
function noteMiss()
   setTextString('misst', 'Misses: ' .. misses)
   setTextString('cobo', 'Combo: ' .. getProperty('combo'))
     if Text.tweens == false then
        setTextColor('accuracy', Colors.SickColor)
        setTextColor('maxcobo', Colors.SickColor)
        setTextColor('misst', Colors.MissColor)
        setTextColor('cobo', Colors.ColorCobo)
     elseif Text.tweens == true then
        doTweenColor('H', 'accuracy', Colors.SickColor, 0.1, Text.ease)
        doTweenColor('Haaaaa', 'maxcobo', Colors.SickColor, 0.1, Text.ease)
        doTweenColor('sM', 'misst', Colors.MissColor, 0.1, Text.ease)
        doTweenColor('sN', 'cobo', Colors.ColorCobo, 0.1, Text.ease)
     end
     
end
end



