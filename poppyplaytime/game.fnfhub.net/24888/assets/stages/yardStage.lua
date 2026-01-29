local charsloaded = 6;
local bfx = 536;
local bfy = -83;
local gfx = 846.95;
local gfy = -287;
local xx = 950
local yy = 250
local xx2 = 1200
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

    makeAnimatedLuaSprite('back','fondo',-210,-290)
	addAnimationByPrefix('back','black','backblack',24,true)
    addAnimationByPrefix('back','ground','background',24,true)
	addLuaSprite('back',false)

	makeAnimatedLuaSprite('huggy','green',1500,-200)
	addAnimationByPrefix('huggy','1','huggy1',24,true)
	addLuaSprite('huggy',false)

    makeAnimatedLuaSprite('negro','blacks',-250,-250)
	addAnimationByPrefix('negro','1','negro1',24,true)
    addAnimationByPrefix('negro','0','negro0',24,true)
	addLuaSprite('negro',true)

    makeLuaSprite('theLightblue','lightbluea',-100,-250)
	addLuaSprite('theLightblue',true)
	setLuaSpriteScrollFactor('theLightblue', 1.0, 1.0)

end

function onBeatHit()

	if mustHitSection then
		setProperty('defaultCamZoom',1.5);
	else
		setProperty('defaultCamZoom',0.8);

	end
    
    if curBeat == 224 then
		objectPlayAnimation('negro','0',true)
	end

    if curBeat == 224 then
		objectPlayAnimation('back','ground',true)
	end

end

function onUpdate()
	if charsloaded == 2 then --see i did this before onCreatePost existed
		setProperty('boyfriend.scrollFactor.x', 1.4);
		setProperty('boyfriend.scrollFactor.y', 1.4);
		setObjectOrder('boyfriend',getObjectOrder('dad'));
		setProperty('gf.visible', false);
		--setObjectOrder('shad',getObjectOrder('dad'));

		



	end



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