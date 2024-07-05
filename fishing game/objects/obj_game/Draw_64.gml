/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var rwidth = display_get_gui_width()
var rheight = display_get_gui_height()
draw_set_font(fnt_pokemon)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text(16,16,score)

draw_set_halign(fa_center)
draw_set_font(fnt_nokia)
draw_set_color(c_yellow)
draw_text(rwidth/2,16,timer)

if game_state = 0 {
	draw_set_color(c_white)
	draw_set_font(fnt_silver)
	draw_text_ext(rwidth/2,rheight/2,"Pressione qualquer tecla para começar",16,rwidth)
}