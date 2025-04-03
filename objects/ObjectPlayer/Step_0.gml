/// @description 
// STEP FUNCTION

ysp+=0.1	// GRAVITY (each frame the player will try to fall downward)
xsp=0		

/// PLAYER MOVEMENT
// IF USER PRESSES LEFT, GO LEFT
if keyboard_check(vk_left) {
	xsp=-1		
}

// IF USER PRESSES LEFT, GO RIGHT
if keyboard_check(vk_right) {
	xsp=+1
}

// IF USER IS ON TOP OF A BLOCK, SET THEIR VERTICAL SPEED TO 0 (stop the player)
if place_meeting(x, y+1, ObjectBlock) {
	ysp=0	// vertical speed set to 0
	if keyboard_check(vk_up) {	// IF USER IS ON A BLOCK AND THEY PRESS UP ARROW KEY, JUMP)
		ysp=-2.5
	}
}

// allows movement horizontally and upon collision with ObjectBlock, the player will stop.
move_and_collide(xsp, ysp, ObjectBlock)


// SPIKE AND LEVEL-FINISH COLLISIONS

// IF USER REACHES FINISH OBJECT, SEND THEM TO NEXT ROOM OR END SCREEN
if place_meeting(x, y, ObjectFinish) {
    if room_next(room) != -1 {	// IF THERE IS A NEXT ROOM, GO TO NEXT LEVEL
        room_goto_next();
    } else {
        room_goto(room_EndScreen); // Send player to the end screen if no more levels
    }
}

// IF PLAYER COLLIDES WITH SPIKE, RESTART GAME
if place_meeting(x,y, ObjectSpike) {
	room_restart()
}