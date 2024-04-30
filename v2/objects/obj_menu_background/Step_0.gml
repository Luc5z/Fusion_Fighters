// Atualizar a animação do plano de fundo
animation_frame += 0.1; // Velocidade da animação

// Se a animação atingir o último frame, volte ao primeiro frame
if (animation_frame > 6) // 6 é o número total de frames da animação
{
    animation_frame = 1;
}

// Definir o sprite com base na variável de animação
sprite_index = asset_get_index("spr_menu_background_" + string(floor(animation_frame)));
