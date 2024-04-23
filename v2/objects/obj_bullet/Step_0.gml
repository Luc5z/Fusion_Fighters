/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(instance_place(x, y, obj_player))
{
	obj_player.estado = player.dano;
	
	with(obj_bullet)
	{
		instance_destroy();
	}
}