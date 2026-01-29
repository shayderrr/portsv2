local charsloaded = 6;
local bfx = 536;
local bfy = -83;
local gfx = 846.95;
local gfy = -287;
local xx = 800
local yy = 400
local xx2 = 800
local yy2 = 700
local xx3 = 146
local yy3 = 103
local xx4 = 96.05
local yy4 = -87.1
local ofs = 40
local zoomshit = 0;
local followchars = true
local camSpeed = 4;
local camInt = 1;
function onCreate()

    makeAnimatedLuaSprite('ground','end',-700,-100)
    addAnimationByPrefix('ground','final','groundfinal',24,true)
	addLuaSprite('ground',false)
    setLuaSpriteScrollFactor('ground', 1.0, 1.0)

    makeAnimatedLuaSprite('tubo','pipe',1300,-100)
    addAnimationByPrefix('tubo','1','tubo1',24,true)
	addLuaSprite('tubo',false)
    setLuaSpriteScrollFactor('tubo', 0.3, 0.8)

    makeAnimatedLuaSprite('red','rojo',-1200,-400)
    addAnimationByPrefix('red','final','redfinal',24,true)
	addLuaSprite('red',true)
    setLuaSpriteScrollFactor('red', 1.0, 1.0)

    makeAnimatedLuaSprite('glow','lucecita',-70,-400)
    addAnimationByPrefix('glow','red','glowred',24,true)
	addLuaSprite('glow',true)
    setLuaSpriteScrollFactor('glow', 1.0, 1.0)

    makeAnimatedLuaSprite('negron','dark',-150,-170)
    addAnimationByPrefix('negron','block','negronblock',24,true)
    addAnimationByPrefix('negron','blackin','negronblackin',24,true)
	addLuaSprite('negron',true)
    setLuaSpriteScrollFactor('negron', 0, 0)

    makeAnimatedLuaSprite('scenery','escena',-150,-170)
    addAnimationByPrefix('scenery','2','scenery2',24,true)
    addAnimationByPrefix('scenery','3','scenery3',24,true)
    addAnimationByPrefix('scenery','1','scenery1',24,true)
	addLuaSprite('scenery',true)
    setLuaSpriteScrollFactor('scenery', 0, 0)

end

function onBeatHit()

	if mustHitSection then
		setProperty('defaultCamZoom',1.3);
	else
		setProperty('defaultCamZoom',0.9);

	end

    if curBeat == 400 then
		objectPlayAnimation('scenery','3',true)
	end
end

function onUpdate()



    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end
end

function onStepHit()
	
end