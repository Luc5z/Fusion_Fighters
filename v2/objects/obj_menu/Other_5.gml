// No evento Room End ou Cleanup do objeto obj_menu
if (audio_is_playing(menu_theme)) {
    audio_stop_sound(menu_theme); // Para o som de fundo ao sair do menu ou ao entrar em outra sala
}

