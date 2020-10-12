if instance_exists(Player)
{
	if instance_number(Player) = 1 //singleplayer camera code
	{
		goalx = (Player.x-game_width/2)
		goaly = (Player.y-game_height/2)
	}
	/*if instance_number(Player) = 2 //multiplayer camera code
	{
		var _dir = point_direction(global.player[0].x,global.player[0].y,global.player[1].x,global.player[1].y);
		var _dist = point_distance(global.player[0].x,global.player[0].y,global.player[1].x,global.player[1].y);
		var _midpointx = global.player[0].x+lengthdir_x(_dist/2,_dir);
		var _midpointy = global.player[0].y+lengthdir_y(_dist/2,_dir);
		camx = ((_midpointx-view_wport/2)-shake/2+irandom(shake))+lengthdir_x(Player.wkick/2,Player.gunangle+180)
		camy = ((_midpointy-view_hport/2)-shake/2+irandom(shake))+lengthdir_y(Player.wkick/2,Player.gunangle+180)
	}*/
	//screenshake
	if shake > 0
	shake -= 1
	//make violent screenshake subside faster
	if shake < 24
	shake -= 1
	if shake < 0
	shake = 0
	
	jerkx = lerp(jerkx,goalx,0.25)-shake/2+irandom(shake)
	jerky = lerp(jerky,goaly,0.25)-shake/2+irandom(shake)
	
	camx = floor(jerkx)
	camy = floor(jerky)
	
	//make sure camera doesnt go out of bounds
	if camx < 0
	camx = 0
	if camy < 0
	camy = 0
	if camx+game_width > room_width
	camx = room_width-game_width
	if camy+game_height > room_height
	camy = room_height-game_height
	camera_set_view_pos(view_camera[0],camx,camy)
}