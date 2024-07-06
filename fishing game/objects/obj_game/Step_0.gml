/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if game_state = 0 {
	if input_check_pressed(all){
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
	if input_check_pressed("mute"){
		if audio_is_playing(snd_bgm) {
			audio_stop_sound(snd_bgm)
			sound_mute = 1;
		} else {
			audio_play_sound(snd_bgm,0,1,0.8)
			sound_mute = 0;
		}
	}
	
	if input_check_pressed("pause"){
		call_later(1,time_source_units_frames,function(){
			game_state = 2
			time_source_pause(ts_fish_spawn)
			time_source_pause(ts_timer)
		})
	}
	
	if timer = 0 {
		game_state = 0;
		time_source_stop(ts_fish_spawn)
		time_source_stop(ts_timer)
		audio_stop_sound(snd_bgm)
	}
	
}

if game_state = 2 {
	
	if input_check_pressed("pause"){
		call_later(2,time_source_units_frames,function(){
		game_state = 1;
		time_source_resume(ts_fish_spawn)
		time_source_resume(ts_timer)
		})
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


if !vbutton_stick.check() {
vbutton_stick.__x = mouse_x
vbutton_stick.__y = mouse_y
}