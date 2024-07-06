/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 //Treat the bottom of the GUI as a reference point
var _rwidth  = display_get_gui_width();
var _rheight = display_get_gui_height();


//Make a thumbstick that follows the player finger around

vbutton_stick =	input_virtual_create()
                    //.circle(150, _rheight - 150, 20)
					.rectangle(0,0,_rwidth,_rheight)
                     .thumbstick(undefined, "left", "right", "up", "down")
                     
                     .release_behavior(INPUT_VIRTUAL_RELEASE.RESET_POSITION);


vbutton_pause = input_virtual_create()
					.rectangle(_rwidth-56,8,_rwidth-8,56)
					.button("pause")
					.priority(100)
vbutton_mute = input_virtual_create()
					.rectangle(_rwidth-112,8,_rwidth-64,56)
					.button("mute")
					.priority(100)
					
/*vbutton_screen = input_virtual_create()
				.rectangle(0,0,_rwidth,_rheight)