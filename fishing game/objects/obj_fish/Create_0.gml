/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


hsp = 0;
vsp = 0;
hsp_max = 2;
vsp_max = 2;

hmovespeed = 0.1
vmovespeed = random_range(0.1,1);
hmove = 0;
vmove = 0;

sprite_angle = 0;
image_speed = 0.5


hdir = 1;
vdir = 1;

type = irandom(8);
value = FISH_ITEM.FISH1
fish_ai = 0;
state = 1;

switch(type) {
	case 0:
		sprite_index = spr_fish1
	break;
	case 1:
		sprite_index = spr_fish2
	break;
	case 2:
		sprite_index = spr_fish3
	break;
	case 3:
		sprite_index = spr_fish4
	break;
	case 4:
		sprite_index = spr_fish5
	break;
	case 5:
		sprite_index = spr_fish6
	break;
	case 6:
		sprite_index = spr_fish7
	break;
	case 7:
		sprite_index = spr_fish8
	break;
	case 8:
		sprite_index = spr_evil_fish
		value = FISH_ITEM.EVILFISH
		fish_ai = FISH_AI.CHASE
	break;
	default:
	break;
}

size = irandom_range(1,4)

image_xscale = size
image_yscale = size

method_fish_ai_choose = function() {
	switch (fish_ai) {
		case 0:
			hmovespeed = random_range(0.1,1)
		break;
		case 1:
			hmovespeed = random_range(0.1,1)
			//vmovespeed = random_range(0.4,1)
			//vmove = choose(-1,1)
		break;
		case 2:
			hmovespeed = random_range(0.1,1)
			vmovespeed = random_range(0.4,1)
			vmove = choose(-1,1)
			vdir = vmove
			time_source_start(ts_fish_ai_2)
		break;
		case 3:
			hmovespeed = random_range(0.2,1.2)
			vmovespeed = random_range(0.4,1)
			vmove = choose(-1,1)
			vdir = vmove
			time_source_start(ts_fish_ai_3)
		break;
		case FISH_AI.CHASE:
			hmovespeed = random_range(0.1,1)
		break;
		default:
			hmovespeed = random_range(0.1,1)
		break;
	}
}

method_fish_ai_2 = function() {
	if vmove = 1 vmove = -1
	if vmove = -1 vmove = 1;
	vdir = vmove
}
method_fish_ai_3 = function() {
	time_source_start(ts_fish_ai_3_1)
}
method_fish_ai_3_1 = function() {
	hmove = 0;
	time_source_start(ts_fish_ai_3_2);
}
method_fish_ai_3_2 = function() {
	if hdir = 1 hmove = -1
	if hdir = -1 hmove = 1;
	hdir = hmove
}

ts_fish_ai_2 = time_source_create(time_source_game,0.25,time_source_units_seconds,method_fish_ai_2,[],-1)
ts_fish_ai_3 = time_source_create(time_source_game,random_range(1,2),time_source_units_seconds,method_fish_ai_3,[],-1)
ts_fish_ai_3_1 = time_source_create(time_source_game,random_range(1,2),time_source_units_seconds,method_fish_ai_3_1,[],-1)
ts_fish_ai_3_2 = time_source_create(time_source_game,random_range(1,2),time_source_units_seconds,method_fish_ai_3_2,[],-1)
ts_fish_ai_choose = time_source_create(time_source_game,5,time_source_units_frames,method_fish_ai_choose)

time_source_start(ts_fish_ai_choose)