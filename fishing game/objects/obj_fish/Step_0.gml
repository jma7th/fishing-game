/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if state = 1 {
if !(hmove = 0) {
	if hsp < hsp_max hsp+=hmovespeed
	if hsp >= hsp_max hsp = hsp_max
}
if (hmove = 0) {
	if hsp > 0 hsp -= hmovespeed
	if hsp <= 0 hsp = 0;
}
if !(vmove = 0) {
	if vsp < vsp_max vsp+=vmovespeed
	if vsp >= vsp_max vsp = vsp_max
}
if (vmove = 0) {
	if vsp > 0 vsp -= vmovespeed
	if vsp <= 0 vsp = 0;
}

if x < -32 {
	//x = 30
	instance_destroy()
}

if (x > room_width+32) {
	instance_destroy()
	//x = room_width-60
}

if y < 240 {
	y = 240
}

if y > room_height-60 {
	y = room_height-60 
}

if type = FISH_TYPE.EVILFISH {
	fish_ai = 8
}


if chase = 0 {
x = x + (hsp*hdir);
y = y + (vsp*vdir);
}
switch (fish_ai) {
	case 0:
	break;
	case 1:
	break;
	case 2:
	break;
	case 8:
		var xx = obj_player.x + obj_player.fishing_line_x2 + obj_player.xhook
		var yy = obj_player.y + obj_player.fishing_line_y2 + 4
		var x1 = obj_player.fishing_line_x1;
		var y1 = obj_player.fishing_line_y1;
		var x2 = obj_player.fishing_line_x2;
		var y2 = obj_player.fishing_line_y2;
		if obj_player.fishing_state = FISH_ITEM.EMPTY {
			if point_distance(x,y,xx,yy) < 64 {
				move_towards_point(xx,yy,4)
				sprite_angle = point_direction(x,y,xx,yy)
				image_xscale = abs(image_xscale)
				chase = 1;
			} else {
				chase = 0;
				sprite_angle = 0;
			}
		}
	break;
	default:
	break;
}

}
if state = 0 {
	var xx = obj_player.x + obj_player.fishing_line_x2 + obj_player.xhook
	var yy = obj_player.y + obj_player.fishing_line_y2 + 4
	
	sprite_angle = point_direction(x,y,xx,yy-1)
	image_xscale = abs(image_xscale)
	hdir = 1;
	x = xx
	y = yy
	//hdir = 1
	//sprite_angle = 90
	
}