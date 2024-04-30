// No evento Colisão do objeto obj_player
if (place_meeting(x, y, obj_portal)) { // Verifica se colidiu com um portal
    audio_play_sound(snd_portal, 10, false); // Reproduz o som snd_portal
}
