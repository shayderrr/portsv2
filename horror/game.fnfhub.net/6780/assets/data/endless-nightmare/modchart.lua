function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)

end


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/120)
    if curStep >= 63 and curStep < 800 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*0.90) * math.pi), i)
        end
    end

    if curStep >= 800 and curStep < 1088 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] - 5 * math.sin((currentBeat + i*0.25) * math.pi), i)
        end
    end

    if curStep >= 1088 and curStep < 1408 then
        for i=0,8 do
        setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*7)), i)
        setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
        camHudAngle = 0.5 * math.sin(currentBeat * math.pi)
        cameraAngle = 0.5 * math.sin(currentBeat * math.pi)
        end
    end

    if curStep >= 1408 and curStep < 1959 then
        for i=0,8 do
        setActorX(_G['defaultStrum'..i..'X'] - 6 * math.sin((currentBeat + i*0.25) * math.pi), i)
    end
end

function beatHit (beat)
   -- do nothing

end 

function stepHit (step)
    local currentBeat = (songPos / 1000)*(bpm/120)
    if curStep >= 60 and curStep < 64 then
        tweenCameraZoom(1.6, 0.2)
    end

    if curStep >= 1079 and curStep < 1088 then
        tweenCameraZoom(1.6, 0.2)
    end

end

function keyPressed (key)
   -- do nothing
end

print("Mod Chart script loaded :)")