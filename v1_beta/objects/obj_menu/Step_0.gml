if (fading) {
    fade_amount += 0.02; // Ajuste essa taxa para tornar o fade mais rápido ou mais lento
    
    if (fade_amount >= 1) {
        fade_amount = 1;
        fading = false;
        
        // Troca de room aqui
        room_goto(Room1); // Substitua next_room pelo nome da próxima room
    }
}