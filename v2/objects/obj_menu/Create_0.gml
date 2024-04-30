// Evento Create
opcoes = ["Start", "Exit"];
opcoes_clone = opcoes;
index = 0;
oplength = array_length(opcoes);
fade_amount = 0;
fading = false;
alarm[0] = room_speed;
offsetX = 0;
offsetY = 0;

// No evento Create do objeto obj_menu
if (!audio_is_playing(menu_theme)) {
    audio_play_sound(menu_theme, 10, true); // Reproduz o som de fundo em loop
}
