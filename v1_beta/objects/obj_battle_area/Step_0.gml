/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(player_entrou)
{	//verificar se existe inimigos dentro da area
	if(instance_exists(obj_enemy_base) and point_in_rectangle (obj_enemy_base.x, obj_enemy_base.y,
	x - sprite_width/2,y - sprite_height/2, x + sprite_width/2, y + sprite_height/2))
	{
		inimigos = true;
	}
	else
	{
		inimigos = false;
	}
}