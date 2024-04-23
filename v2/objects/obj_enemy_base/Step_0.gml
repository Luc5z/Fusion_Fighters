/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region notando player

	if(distance_to_object(obj_player) < visao and !seguiu)
	{
		
		estado = enemy.seguindo;
		seguiu = true;
	
	}

switch (estado) {
	
	case enemy.parado:
	
		if(!invencivel)
		{
			speed = 0;
			sprite_index = sprite_andando;
			image_speed = 0;
			
			if(!alarm[3])
			{
			alarm[3] = room_speed * (random_range(1,2));
			}
		}
		else
		{
			
			estado = enemy.seguindo;
			
		}
		
	break;
	
	case enemy.seguindo:
	
		sprite_index = sprite_andando;
		image_speed = 1;
		
		var playerinst = instance_find(obj_player, 0);
		if(playerinst != noone)
		{
			
			var localplayer = point_direction(x, y, playerinst.x, playerinst.y);
			motion_add(localplayer, 0.4);
			if(speed > 0.4)
			{
				speed = 0.4;
			}
			if(x < playerinst.x)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
			
			// verificando proximidade para fazer ataque "se tiver"
			if(distance_to_object(playerinst) <= distanciagolpe)
			{
				
				estado = enemy.atacando;
				
			}
			
			if(!alarm[2])
			{
			alarm[2] = room_speed * (random_range(2,5));
			}
		}
		else
		{
			estado = enemy.parado;
		}

	
	break;
	
	case enemy.atacando:
		
		speed = 0;
		sprite_index = sprite_atacando;
		
		if(image_index == 0 and instance_place(x, y, obj_player))
		{
			obj_player.estado = player.dano;
		}
		
		if(image_index == image_number)
		{
			estado = enemy.parado;
		}
		
	break;

	#region inimigo dano e morte

	case enemy.dano:
	
		speed = 0;
		
		if(!invencivel) {
			
			sangue--;
			
			if (sangue <= 0)
			{ //inimigo morto
				if (place_meeting(x, y, obj_chao) and !pulou)
				{
					temp_y = y;
					mov_vertical = -7.5;
					mov_horizontal = sign(image_xscale) *2;
					sprite_index = sprite_morte;
					image_speed = 1;
					image_index = 0;
					pulou = true; 	
				}
					else
					{
						if(y < temp_y)
						{
							mov_vertical += gravidade;
						}
						else
						{
							mov_vertical = 0;
							mov_horizontal = 0;
							sprite_index = sprite_morte;
							alarm[1] = room_speed;
							estado = enemy.morte;
						}
					}
			}
			else
			{ //Dano que o inimmigo recebeu
			
				sprite_index = sprite_dano;
				image_speed = 0;
				image_index = choose(0,1);
				invencivel = true;
				alarm[0] = room_speed/2;
				estado = enemy.parado;
			
			}
			
		}
		
		else
			{
				estado = enemy.seguindo;
			}
			
		y += mov_vertical;
		x += mov_horizontal;
	
	break;
	
	case enemy.morte:
	
		speed = 0;
	
	break;
	
	#endregion
	
}

show_debug_message(sangue);