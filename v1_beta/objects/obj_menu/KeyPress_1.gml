var esc = keyboard_check_pressed(vk_escape);
var alt = keyboard_check_pressed(vk_alt);
var f4 = keyboard_check_pressed(vk_f4);

if(esc)||(alt && f4){
	game_end();
}