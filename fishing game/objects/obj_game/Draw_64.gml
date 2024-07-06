/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _rwidth = display_get_gui_width()
var _rheight = display_get_gui_height()
draw_set_font(fnt_pokemon)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text(16,16,score)

draw_set_halign(fa_center)
draw_set_font(fnt_nokia)
draw_set_color(c_yellow)
draw_text(_rwidth/2,16,timer)

if game_state = 0 {
	draw_set_color(c_white)
	draw_set_font(fnt_silver)
	draw_text_ext(_rwidth/2,_rheight/2,"Pressione qualquer tecla para começar",16,_rwidth)
}

if game_state = 2 {
draw_set_color(c_white)
	draw_set_font(fnt_silver)
	draw_text_ext(_rwidth/2,_rheight/2,"Pausa",16,_rwidth)
}

draw_sprite(spr_mute,sound_mute,_rwidth-112,8)
draw_sprite(spr_pause,(game_state=2),_rwidth-56,8)

//input_virtual_debug_draw()