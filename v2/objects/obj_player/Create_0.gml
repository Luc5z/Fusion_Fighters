/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

gravidade = 0.35;
mov_vertical = 0;
temp_y = 0;
pulou = false;

velocidade = 0.75;
xspeed = 0;
yspeed = 0;
depth = 0;

sangueplayer = 5;
sangueplayermax = 5;
isDying = false;

enum player
{
	parado,
	andando,
	pulando,
	atacando,
	dano,
	morrendo
}

estado = player.parado;


som_reproduzido = false;

attack_cooldown = 0; 



