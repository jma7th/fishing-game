/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if game_state = 0 {
	if keyboard_check_pressed(vk_anykey){
		time_source_start(ts_fish_spawn)
		time_source_start(ts_timer)
		audio_play_sound(snd_bgm,0,1,0.8)
		game_state = 1
		score = 0;
		timer = 60;
		obj_player.fishing_line = obj_player.fishing_line_min
		obj_player.fishing_state = FISH_ITEM.EMPTY
		instance_destroy(obj_fish)
	}
}

if game_state = 1 {
	if keyboard_check_pressed(ord("M")){
		if audio_is_playing(snd_bgm) {
			audio_stop_sound(snd_bgm)
		} else {
			audio_play_sound(snd_bgm,0,1,0.8)
		}
	}
	
	if timer = 0 {
		game_state = 0;
		time_source_stop(ts_fish_spawn)
		time_source_stop(ts_timer)
		audio_stop_sound(snd_bgm)
	}
	
}
if score_buffer > 0 {
	score_buffer -=10;
	score+=10;
}
if score_buffer < 0 {
	score_buffer +=10;
	score-=10;
}
if score < 0 {score = 0}

if score > hiscore hiscore = score
