function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)

end


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/80)
    if curStep >= 63 and curStep < 192 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*0.25) * math.pi), i)
        end
    end

    if curStep >= 191 and curStep < 224 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.sin((currentBeat + i*0.25) * math.pi), i)
	    camHudAngle = 5 * math.sin(currentBeat * math.pi)
	    camHudAngle = 5 * math.sin(currentBeat * math.pi)
        end
    end

    if curStep >= 224 and curStep < 255 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] - 10 * math.sin((currentBeat + i*0.25) * math.pi), i)
            camHudAngle = -5 * math.sin(currentBeat * math.pi)
	    camHudAngle = -5 * math.sin(currentBeat * math.pi)
        end
    end 

    if curStep >= 255 and curStep < 383 then
        for i=0,8 do
            setActorX(_G['defaultStrum'..i..'X'] + 15 * math.sin((currentBeat + i*0.25) * math.pi), i)
            camHudAngle = 0 * math.sin(currentBeat * math.pi)
        end
    end

    if curStep >= 519 and curStep < 639 then
        for i=0,8 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*7)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end

    if curStep >= 639 and curStep < 1000 then
        for i=0,8 do
            setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat + i*7)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end

end



function beatHit (beat)
   -- do nothing

end 

function stepHit (step)
    local currentBeat = (songPos / 1000)*(bpm/120)
    if curStep >= 56 and curStep < 57 then
        tweenCameraZoom(1.6, 0.2)
    end

    if curStep >= 222 and curStep < 255 then
        tweenCameraZoom(1.6, 0.2)
    end
    if curStep >= 191 and curStep < 224 then
        tweenCameraZoom(1.3, 0.2)
    end

    if curStep >= 479 and curStep < 494 then
        tweenCameraZoom(1.6, 0.2)
    end

    if curStep >= 503 and curStep < 511 then
        tweenCameraZoom(1.6, 0.2)
    end

    if curStep >= 511 and curStep < 519 then
        tweenCameraZoom(1.6, 0.2)
    end

end

function keyPressed (key)
   -- do nothing

end

print("Mod Chart script loaded :)")