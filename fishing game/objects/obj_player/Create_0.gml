/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
dir = 1;
movespeed = 0.2;

hmove = 0;

hsp = 0;
hsp_frame = 1;
hsp_max = 2;

enum FISH_ITEM {
	EMPTY,
	FISH1,
	FISH2,
	FISH3,
	EVILFISH,
}

enum FISH_TYPE {
	FISH1,
	FISH2,
	FISH3,
	FISH4,
	FISH5,
	FISH6,
	FISH7,
	FISH8,
	EVILFISH
}


fishing_state = FISH_ITEM.EMPTY; // 0 = empty

fishing_line_min = 4
fishing_line_max = 400;
fishing_line = fishing_line_min;
fishing_line_speed = 2;
fishing_line_weight = 1;



fishing_line_x1 = 30
fishing_line_y1 = -16
fishing_line_x2 = 30
fishing_line_y2 = fishing_line_min

sprite_angle = 0;
ysprite = 0;
ysprite_max = 0;
ysprite_speed = 0;
ysprite_speed_max = 0.2;
ysprite_speed_frame = 1;
ysprite_direction = 1
ysprite_clamp = 3

xhook = 0;
xhook_speed = 0;
xhook_speed_max = 1;
xhook_speed_frame = 1;
xhook_direction = 1;

yhook = 0;
yhook_speed = 0;
yhook_speed_max = 1;
yhook_speed_frame = 1;
yhook_direction = 1;