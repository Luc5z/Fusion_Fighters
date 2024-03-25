/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

invencivel = false;
sangue = 10;
sanguemaximo = 10;
mov_horizontal = 0;
mov_vertical = 0;
gravidade = 0.35;
temp_y = 0;
pulou = false;
depth = 1;

seguiu = false;
visao = 50;
distanciagolpe = 3;

enum enemy {
	
	parado,
	seguindo,
	atacando,
	dano,
	morte
}

estado = noone;