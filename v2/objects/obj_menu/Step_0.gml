if (fading) {
    fade_amount += 0.02; // Ajuste essa taxa para tornar o fade mais rápido ou mais lento
    
    if (fade_amount >= 1) {
        fade_amount = 1;
        fading = false;
        
        // Troca de room aqui
        room_goto(Area_de_trabalho); // Substitua next_room pelo nome da próxima room
    }
}

// Verificar seleção com as setas
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
    audio_play_sound(snd_select, 10, false);
}

// Verificar tecla "Start" (ou "Enter" ou "Z" dependendo do seu jogo)
if (keyboard_check_pressed(vk_enter)) {
    audio_play_sound(snd_confirm, 10, false); // Toca o som "snd_confirm"
    audio_stop_sound(menu_theme);
}

