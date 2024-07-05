/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if keyboard_check(vk_up) {
	if fishing_line > fishing_line_min {
		fishing_line -= fishing_line_speed - (fishing_line_weight/4)
	}
}

if keyboard_check(vk_down) {
	if fishing_line < fishing_line_max {
		fishing_line += fishing_line_speed
	}
}

fishing_line = clamp(fishing_line,fishing_line_min,fishing_line_max)
fishing_line_y2 = fishing_line


if keyboard_check(vk_left) {
	hmove = -1;
	dir = -1;
}

if keyboard_check(vk_right) {
	hmove = 1;
	dir = 1;
}

if !(keyboard_check(vk_right)) && !(keyboard_check(vk_left)) {
	hmove = 0;
}

if !(hmove = 0) {
	if hsp < hsp_max hsp+=movespeed
	if hsp >= hsp_max hsp = hsp_max
		
	if xhook_speed < xhook_speed_max xhook_speed+=0.01
	if xhook_speed >= xhook_speed_max xhook_speed=xhook_speed_max
	
	if !(xhook_direction = dir) {
		xhook_speed = 0;
		xhook_direction = dir
	}
	
}
if (hmove = 0) {
	if hsp > 0 hsp -= movespeed
	if hsp <= 0 hsp = 0;
	
	if xhook_speed > 0 xhook_speed-=0.005
	if xhook_speed <= 0 xhook_speed=0
}
if x < 30 {
	x = 30
	if xhook_speed > 0 xhook_speed -= 0.1;
}

if (x > (room_width-60)) {
	x = room_width-60
	if xhook_speed > 0 xhook_speed -= 0.1;
}

x = x + (hsp*dir);

ysprite = ysprite + (ysprite_speed * ysprite_direction)
if ysprite_speed_frame = 1 {
	if ysprite_speed < ysprite_speed_max {
		ysprite_speed += 0.01
	}

	if ysprite_speed >= ysprite_speed_max {
		ysprite_speed_frame = -1
	}
}
if ysprite_speed_frame = -1 {
	if ysprite_speed > 0 {
		ysprite_speed -= 0.02
	}

	if ysprite_speed <= 0 {
		ysprite_direction *= -1
		ysprite_speed_frame = 1
	}
}


xhook = xhook + (xhook_speed * xhook_direction)

var obj_col = collision_rectangle(x+fishing_line_x2+xhook-4,y+fishing_line_y2-4,x+fishing_line_x2+xhook+4,y+fishing_line_y2+4,obj_fish,0,0) 

if (obj_col) {
	if fishing_state = FISH_ITEM.EMPTY {
		fishing_state = obj_col.value
		obj_col.state = 0
		audio_play_sound(snd_fish_catch,2,0,0.5)
	} else {
		fishing_line_weight = obj_col.size;
		if fishing_line = fishing_line_min {
			switch(fishing_state) {
				case FISH_ITEM.FISH1:
					obj_game.score_buffer+= 100*obj_col.size;
				break;
				case FISH_ITEM.EVILFISH:
					obj_game.score_buffer-= 100*obj_col.size;
				break;
				default:
				break;
			}
			instance_destroy(obj_col);
			fishing_state = FISH_ITEM.EMPTY
			audio_play_sound(choose(snd_fish_reel_2,snd_fish_reel),2,0,0.5)
			fishing_line_weight = 1;
		}
	}
}

