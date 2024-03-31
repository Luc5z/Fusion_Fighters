draw_set_font(ft_menu);
draw_set_color(c_white);
draw_set_color(c_black);
draw_set_alpha(fade_amount);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1); // Reseta a transparência para o padrão

var scale = 1
var largura = display_get_gui_width();
var altura = display_get_gui_height();
var eixoY = altura / 2;
var eixoX = largura / 2;

if(is_array(opcoes)){
	for(var i = 0; i < oplength; i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	var text_end = opcoes_clone[i]
	if(index == i){
		draw_set_color(c_red);
		scale = 1.1;
		text_end = "> " + text_end + " <"
	} else {
	    draw_set_color(c_white);
		scale = 1;
	}
		draw_text_transformed(eixoX + offsetX,eixoY + (60 * i) + offsetY, text_end, scale, scale, 0);
	}
}

draw_set_font(-1);