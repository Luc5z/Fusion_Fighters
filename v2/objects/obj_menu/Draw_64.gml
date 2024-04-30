// Desenhar GUI
draw_set_font(ft_menu);
draw_set_color(c_white);
draw_set_alpha(fade_amount);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1); // Reseta a transparência para o padrão

var largura = display_get_gui_width();
var altura = display_get_gui_height();
var eixoY = altura / 2 - 60; // Posição vertical central
var eixoX = largura / 2; // Posição horizontal central

var spr_start_width = sprite_get_width(spr_start);
var spr_start_height = sprite_get_height(spr_start);
var spr_exit_width = sprite_get_width(spr_exit);
var spr_exit_height = sprite_get_height(spr_exit);

var offsetX_start = (largura - spr_start_width) / 2.8;
var offsetY_start = eixoY;

var offsetX_exit = (largura - spr_exit_width) / 2.2;
var offsetY_exit = eixoY + 60; // Espaçamento vertical entre os botões

var brightness = 2.0; // Brilho inicial

if (is_array(opcoes)) {
    for (var i = 0; i < oplength; i++) {
        
        var sprite_to_draw = -1;
        var scale = 2;
        var offsetX = 0;
        var offsetY = 0;
        
        if (i == 0) { // Start
            sprite_to_draw = spr_start;
            offsetX = offsetX_start;
            offsetY = offsetY_start;
        } else if (i == 1) { // Exit
            sprite_to_draw = spr_exit;
            offsetX = offsetX_exit;
            offsetY = offsetY_exit;
        }
        
        if (index == i) {
            draw_set_color(c_white);
            scale = 2;
            
            if (keyboard_check_pressed(vk_enter)) {
                audio_play_sound(snd_confirm, 10, false);
                audio_stop_sound(menu_theme); // Para o som quando "Enter" é pressionado
            }
        } else {
            draw_set_color(c_white);
            brightness = 0.8; // Reduz o brilho para os não selecionados
        }
        
        if (sprite_to_draw != -1) {
            draw_sprite_ext(sprite_to_draw, 0, offsetX, offsetY, scale, scale, 0, make_colour_rgb(brightness * 255, brightness * 255, brightness * 255), 1);
        }
        
        brightness = 1.0; // Reseta o brilho para o próximo loop
    }
}

// Verificar seleção com as setas
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
    audio_play_sound(snd_select, 10, false);
}