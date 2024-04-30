// Evento: End Step

// Verificar se o objeto atual é o inimigo específico (por exemplo, obj_enemy01)
if (object_index == obj_enemy01)
{
    // Se o estado do inimigo for "morte" e o som de morte ainda não estiver tocando
    if (estado == enemy.morte and !audio_is_playing(snd_enemy01))
    {
        audio_play_sound(snd_enemy01, 1, false); // Reproduzir som de morte "snd_enemy01"
    }
}
