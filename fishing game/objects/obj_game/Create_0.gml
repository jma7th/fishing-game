/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
randomize();
score_buffer = 0;
fish_limit = 16
timer = 60;
game_state = 0;
hiscore = 0;
ts_timer = time_source_create(time_source_game,1,time_source_units_seconds,function() {timer-=1},[],-1)

enum FISH_AI {
	NORMAL,
	DIAGONAL,
	DIAGONAL2,
	HORIZONTAL,
	CHASE
}

method_fish_spawn = function() {
	if (instance_number(obj_fish) < fish_limit) {
		var xd = choose(0,1)
		var xx = -16+((room_width+32)*xd)
		var yy = irandom_range(200,360)
		var obj = instance_create_depth(xx,yy,obj_player.depth-1,obj_fish)
		obj.fish_ai = choose(0,1,2,3)
		if xd = 0 {
			with (obj) {
				hmove = 1;
				hdir = 1;
			}
		}
	
		if xd = 1 {
			with (obj) {
				hmove = -1;
				hdir = -1;
			}
		}
	}
}
ts_fish_period = 2;
ts_fish_spawn = time_source_create(time_source_game,ts_fish_period,time_source_units_seconds,method_fish_spawn,[],-1)

