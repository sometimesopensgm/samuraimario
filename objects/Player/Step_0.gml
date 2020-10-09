//put the player on the ground or something
if grounded = false and place_meeting(x,y+1,parSolid)
{
	grounded = true	
}
if !place_meeting(x,y+1,parSolid)
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
if _jump > 0 and grounded = true
{
	vspd = -jspd
	grounded = false
}
if _jumprelease and vspd < 0
{
	vspd /= 2	
}
vspd += grav

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
	sprite_index = spr_jump	
}

//Collisions
if (place_meeting(x + hspd, y, parSolid)) {
    while (!place_meeting(x + sign(hspd), y, parSolid))
        x += sign(hspd);
    hspd = 0;
}
x += hspd

if (place_meeting(x, y + vspd, parSolid)) {
    while (!place_meeting(x, y + sign(vspd), parSolid))
        y += sign(vspd);
    vspd = 0;
}
y += vspd