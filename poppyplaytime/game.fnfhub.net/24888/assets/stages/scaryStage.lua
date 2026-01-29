local charsloaded = 6;
local bfx = 536;
local bfy = -83;
local gfx = 846.95;
local gfy = -287;
local xx = 600
local yy = 400
local xx2 = 850
local yy2 = 650
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

    makeLuaSprite('theBlack','black',-210,-290)
	addLuaSprite('theBlack',false)
	setLuaSpriteScrollFactor('theBlack', 1.0, 1.0)

    makeLuaSprite('theScene2','scene2',-650,-150)
	addLuaSprite('theScene2',false)
	setLuaSpriteScrollFactor('theScene2', 1.0, 1.0)

    makeAnimatedLuaSprite('huggy','wuggy1',400,700)
	addAnimationByPrefix('huggy','2','huggy2',24,true)
    addAnimationByPrefix('huggy','a','huggya',24,true)
	addLuaSprite('huggy',false)

    makeLuaSprite('theLight1','light1',100,-500)
	addLuaSprite('theLight1',false)
	setLuaSpriteScrollFactor('theLight1', 1, 1)

    makeAnimatedLuaSprite('a','luz',-200,-500)
	addAnimationByPrefix('a','thing','athing',24,true)
    addAnimationByPrefix('a','light2','alight2',24,true)
	addLuaSprite('a',true)
    setLuaSpriteScrollFactor('a', 1.0, 1.0)

    makeAnimatedLuaSprite('scenery','escena',-150,-170)
	addAnimationByPrefix('scenery','3','scenery3',24,true)
    addAnimationByPrefix('scenery','2','scenery2',24,true)
    addAnimationByPrefix('scenery','1','scenery1',24,true)
	addLuaSprite('scenery',true)
    setLuaSpriteScrollFactor('scenery', 0, 0)

    makeAnimatedLuaSprite('place','huggyscene',-140,165)
    addAnimationByPrefix('place','2','place2',24,true)
    addAnimationByPrefix('place','1','place1',24,true)
	addLuaSprite('place',true)

    makeAnimatedLuaSprite('bf','escenario',-100,130)
    addAnimationByPrefix('bf','point','bfpoint',24,true)
    addAnimationByPrefix('bf','escena','bfescena',24,true)
	addLuaSprite('bf',true)

    makeAnimatedLuaSprite('hand','manita',137,170)
    addAnimationByPrefix('hand','punto','handpunto',24,true)
    addAnimationByPrefix('hand','scene','handscene',24,true)
	addLuaSprite('hand',true)

    makeAnimatedLuaSprite('fondo','background2',-1500,-600)
    addAnimationByPrefix('fondo','point','fondopoint',24,true)
    addAnimationByPrefix('fondo','black','fondoblack',24,true)
	addLuaSprite('fondo',false)

    makeAnimatedLuaSprite('light','luci1',600,-450)
	addAnimationByPrefix('light','2','light2',24,true)
    addAnimationByPrefix('light','1','light1',24,true)
	addLuaSprite('light',true)
    setLuaSpriteScrollFactor('light', 1.0, 1.0)
    
    makeAnimatedLuaSprite('luz','luci2',-550,-550)
	addAnimationByPrefix('luz','2','luz2',24,true)
    addAnimationByPrefix('luz','1','luz1',24,true)
	addLuaSprite('luz',true)
    setLuaSpriteScrollFactor('luz', 1.0, 1.0)

    makeAnimatedLuaSprite('ground','end',-700,-100)
    addAnimationByPrefix('ground','putito','groundputito',24,true)
    addAnimationByPrefix('ground','final','groundfinal',24,true)
	addLuaSprite('ground',false)
    setLuaSpriteScrollFactor('ground', 1.0, 1.0)

    makeAnimatedLuaSprite('tubo','pipe',1300,-100)
    addAnimationByPrefix('tubo','2','tubo2',24,true)
    addAnimationByPrefix('tubo','1','tubo1',24,true)
	addLuaSprite('tubo',false)
    setLuaSpriteScrollFactor('tubo', 0.3, 0.8)

    makeAnimatedLuaSprite('red','rojo',-1200,-400)
    addAnimationByPrefix('red','a','reda',24,true)
    addAnimationByPrefix('red','final','redfinal',24,true)
	addLuaSprite('red',true)
    setLuaSpriteScrollFactor('red', 1.0, 1.0)

    makeAnimatedLuaSprite('glow','lucecita',-70,-400)
    addAnimationByPrefix('glow','e','glowe',24,true)
    addAnimationByPrefix('glow','red','glowred',24,true)
	addLuaSprite('glow',true)
    setLuaSpriteScrollFactor('glow', 1.0, 1.0)

    makeAnimatedLuaSprite('negron','dark',-150,-170)
    addAnimationByPrefix('negron','block','negronblock',24,true)
    addAnimationByPrefix('negron','blackin','negronblackin',24,true)
	addLuaSprite('negron',true)
    setLuaSpriteScrollFactor('negron', 0, 0)

end

function onBeatHit()

	if mustHitSection then
		setProperty('defaultCamZoom',0.9);
	else
		setProperty('defaultCamZoom',1);

	end

    if curBeat == 1 then
		objectPlayAnimation('scenery','1',true)
	end

    if curBeat == 8 then
		objectPlayAnimation('scenery','2',true)
	end

    if curBeat == 8 then
		objectPlayAnimation('bf','escena',true)
	end

    if curBeat == 16 then
		objectPlayAnimation('bf','point',true)
	end

    if curBeat == 16 then
		objectPlayAnimation('place','1',true)
	end

    if curBeat == 22 then
		objectPlayAnimation('place','2',true)
	end

    if curBeat == 24 then
		objectPlayAnimation('a','light2',true)
	end

    if curBeat == 216 then
		objectPlayAnimation('hand','scene',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('hand','punto',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('huggy','a',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('a','thing',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('fondo','black',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('luz','1',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('light','1',true)
	end

    if curBeat == 352 then
		objectPlayAnimation('luz','2',true)
	end

    if curBeat == 352 then
		objectPlayAnimation('light','2',true)
	end

    if curBeat == 350 then
		objectPlayAnimation('red','final',true)
    end

    if curBeat == 352 then
		objectPlayAnimation('negron','blackin',true)
	end

    if curBeat == 352 then
		objectPlayAnimation('ground','final',true)
    end

    if curBeat == 352 then
		objectPlayAnimation('glow','red',true)
    end

    if curBeat == 352 then
		objectPlayAnimation('tubo','1',true)
    end

    if curBeat == 358 then
		objectPlayAnimation('negron','block',true)
	end

    if curBeat == 928 then
		objectPlayAnimation('scenery','3',true)
	end

end

function onUpdate()



    if followchars == false then
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