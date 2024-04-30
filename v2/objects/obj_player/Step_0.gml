/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//if(global.pause)exit;


#region Entradas do Teclado
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
space = keyboard_check_pressed(vk_space);
punch = keyboard_check(ord("Z"))
left_released = keyboard_check_released(vk_left);
right_released = keyboard_check_released(vk_right);
up_released = keyboard_check_released(vk_up);
down_released = keyboard_check_released(vk_down);
#endregion

#region profundidade do cenario
	
	var inimigo = instance_place( x, y, obj_enemy_base);
	
	if(inimigo != noone)
	{
		if( y < inimigo.y)
		{
			depth = 2;
		}
		else
		{
			depth = 0;
		}
	}
	
	var inimigo = instance_place( x, y, obj_enemy_correio);
	
	if(inimigo != noone)
	{
		if( y < inimigo.y)
		{
			depth = 2;
		}
		else
		{
			depth = 0;
		}
	}
	
	
#endregion

#region Verificando o sangue 
	
	if(sangueplayer <= 0)
	{
		estado = player.morrendo;
	}
	
#endregion

#region verificando area de combate

	var inst_area = instance_place(x, y, obj_battle_area);
	
	if(inst_area != noone)
	{
		inst_area.player_entrou = true;
		
		if(x >= (inst_area.x + inst_area.sprite_width/2) and inst_area.inimigos)
		{
			x = inst_area.x + inst_area.sprite_width/2;
		}
	}

#endregion

switch(estado)
{	
	
	#region player parado
	
	case player.parado:
		
		xspeed = 0;
		yspeed = 0;
		
		
		sprite_index = spr_player_idle
		
		if (left or right or up or down)
			{
				estado = player.andando;
			}
		
		if (space)
			{
				estado = player.pulando;
				pulou = false;
			}
		else if (punch)
			{
				estado = player.atacando;
				image_index = 0;
			}
		
	break;
	
	#endregion
	
	#region player andando
	
	case player.andando:
	
		sprite_index = Spr_player_walk;
		image_speed = 1;
		
		if(left or right)
		{
			if(abs(xspeed) <= velocidade)
			{
			 xspeed += (right - left) * velocidade;
			}
		}
		
		if (up or down)
		{
			if(abs(yspeed)<= velocidade)
			{
				yspeed += (down - up) * velocidade;
			}
		}
		
		if(xspeed !=0)
		{
			image_xscale = sign(xspeed);
		}
		
		if(right_released or left_released or up_released or down_released)
		{
			estado = player.parado;
		}
		
		if (space)
		{
			estado = player.pulando;
			pulou = false;
		}
		else if (punch)
		{
			estado = player.atacando;
			image_index = 0;
		}
		
		if (left or right or up or down)
{
    if (!audio_is_playing(step_sound))
    {
        audio_play_sound(step_sound, 10, false);
    }
    
    if(abs(xspeed) <= velocidade)
    {
        xspeed += (right - left) * velocidade;
    }
    
    if(abs(yspeed) <= velocidade)
    {
        yspeed += (down - up) * velocidade;
    }
}

		
	break;
	
	#endregion
	
#region player pulando
    
case player.pulando:
    if (mov_vertical > 0)
    {
        image_index = 1;
    }
    
    if (place_meeting(x, y, obj_chao) and !pulou)
    {
        temp_y = y;
        mov_vertical = -7.5;
        sprite_index = spr_player_jump;
        image_speed = 0;
        image_index = 0;
        pulou = true;
        
        // Reproduz o som do pulo do jogador
        audio_play_sound(snd_player_jump, 10, false);
    }
    else
    {
        if (y < temp_y)
        {
            mov_vertical += gravidade;
        }
        else
        {
            mov_vertical = 0;
            estado = player.parado;
        }
    }
    
    y += mov_vertical;
    
break;

	
	#endregion
	
	#region player atacando
	
case player.atacando:
	
	
		yspeed = 0;
		xspeed = 0;
	
		var inst = instance_place(x, y, obj_enemy_base);
		
		if (inst != noone){
		
			inst.estado = enemy.dano
			}

		sprite_index = spr_player_punch;
		image_speed =0;
		if(image_index == image_number - 2)
		{
			estado = player.parado;
		}
		else if(punch) 
		{
			image_index = 0;
		}
		
		if (attack_cooldown <= 0) {
            // Reproduz o som de ataque
            audio_play_sound(snd_player_attack, 10, false);
            
            // Define o cooldown do ataque para 500 ms
            attack_cooldown = room_speed * 0.25; // 30 * 0.5 = 15 frames (aproximadamente 500ms)
        }
        else {
            // Se o cooldown ainda estiver ativo, decrementa o contador
            attack_cooldown -= 1;
        }
        break;
	
	#endregion
	
	#region player dano
	
case player.dano:
        speed = 0;
        sprite_index = spr_player_damage;
        
        // Reproduzir o som de dano apenas se ainda não foi reproduzido
        if (!som_reproduzido)
        {
            audio_play_sound(damage_player_sound, 10, false);
            som_reproduzido = true; // Marcar que o som foi reproduzido
        }
        
        if (!alarm[0])
        {
            sangueplayer--;
            alarm[0] = room_speed / 3;
            
            // Resetar a variável para o próximo dano
            som_reproduzido = false;
        }

	break;
	
	#endregion
	
	#region player morrendo
	
	case player.morrendo:
	
	sprite_index = spr_player_death;
	
	if (image_index == image_number -1)
	{
		speed = 0;
		image_speed = 1;
		image_index = 0;
		
		alarm[1] = room_speed;
	}
	
	break;
	
	#endregion

}

if(estado != player.pulando)
	{
		y = clamp(y, 128, 192);
	}

if (estado != player.morrendo)
{
	x += xspeed;
	y += yspeed;
}
