/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if keyboard_check(ord("M")){
	if audio_is_playing(snd_bgm) {
		audio_stop_sound(snd_bgm)
	} else {
		audio_play_sound(snd_bgm,0,1,0.8)
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