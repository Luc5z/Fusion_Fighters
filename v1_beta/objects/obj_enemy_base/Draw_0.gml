/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//vida do nosso inimigo
draw_self();

if(invencivel){
	draw_healthbar(x-10, y-sprite_height/2, x+10, y-sprite_height/2, (sangue/sanguemaximo) *100,
	c_black, c_red, c_lime, 1 , true, true);
}