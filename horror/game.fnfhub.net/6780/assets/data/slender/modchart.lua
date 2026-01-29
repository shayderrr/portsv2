function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)

}


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/120)
    if(curStep >= 287 && curStep < 303){
        tweenCameraZoom(1.5, 4.5);
    }

    if(curStep >= 423 && curStep < 431){
        tweenCameraZoom(1.2, 0.5);
    }


}



function beatHit (beat)
   -- do nothing

} 

function stepHit (step)


}

function keyPressed (key)
   -- do nothing
}

print("Mod Chart script loaded :)")