//put the player on the ground or something
if grounded = false and place_meeting(x,y+1,parSolid)
{
	grounded = true	
}
if !place_meeting(x,y+1,parSolid) and !place_meeting(x,y+1,colPlatform)
{
	grounded = false	
}
//input, horizontal
var _leftright = keyboard_check(vk_right)-keyboard_check(vk_left)
hspd += acceleration * sign(_leftright);
hspd = median(-maxspeed,hspd,maxspeed);
if _leftright = 0 and hspd != 0
hspd -= fric*sign(hspd)

//input, vertical
var _jump = keyboard_check_pressed(vk_up) + keyboard_check_pressed(vk_space)
var _jumprelease = keyboard_check_released(vk_up) + keyboard_check_released(vk_space)
var _downpress = keyboard_check_pressed(vk_down)
if _jump > 0
{
	buffer_jump = 4;
}
if buffer_jump-- > 0 and (grounded = true || coyote_time > 0)
{
	vspd = -jspd;
	grounded = false;
	coyote_time = 0;
}
if _jumprelease and vspd < 0
{
	vspd /= 2	
}
if coyote_time-- < 0
{
	vspd += grav
}
if _downpress and place_meeting(x,y+1,colPlatform) and grounded = true
{
	grounded = false
	y += 2
	coyote_time = 0
}

//handle sprites
if hspd != 0
{
	right = sign(hspd)
	sprite_index = spr_walk
}
else
{
	sprite_index = spr_idle	
}
if grounded = false 
{
	if coyote_time <= 0
	{
		sprite_index = spr_jump	
	}
}else{
	coyote_time = 3;		
}

//Collisions
// Vertical
repeat(abs(vspd)) 
{
    if (!place_meeting(x,y+sign(vspd),parSolid))
        y += sign(vspd)
    else 
	{
		//landing
        vspd = 0
        break;
    }
}
// Check to make sure the player isn't jumping and not inside of a platform. 
if  vspd > 0 && (place_meeting(x,y+vspd,colPlatform)) && !(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-1, colPlatform, false, false))
{
     while(!place_meeting(x,y+sign(vspd),colPlatform))
     { 
        y += sign(vspd);
     }
	 grounded = true;
     vspd = 0;
}
    
// Horizontal
repeat(abs(hspd)) 
{
    
    //Move up slope
    if (place_meeting(x+sign(hspd),y,parSolid) and !place_meeting(x+sign(hspd),y-1,parSolid)) and grounded = true
	{
		while(place_meeting(x+sign(hspd),y,parSolid))
		{
			y -= 1
		}
	}
    // Move down slope
    if (!place_meeting(x+sign(hspd),y,parSolid) and !place_meeting(x+sign(hspd),y+1,parSolid) and place_meeting(x+sign(hspd),y+2,parSolid)) and grounded = true
	{
        y += 1
	}
    
    if (!place_meeting(x+sign(hspd),y,parSolid))
        x += sign(hspd)
    else 
	{
        hspd = 0
        break;
    }
}