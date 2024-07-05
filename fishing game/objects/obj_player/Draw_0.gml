/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_sprite_ext(sprite_index,image_index,x,y+ysprite,image_xscale,image_yscale,sprite_angle,image_blend,image_alpha)
draw_line_color(x+fishing_line_x1,
				y+fishing_line_y1+ysprite,
				x+fishing_line_x2+xhook,
				y+fishing_line_y2+(ysprite/2),
				c_white,
				c_gray)
draw_sprite(spr_hook,-1,x+fishing_line_x2+xhook,y+fishing_line_y2)