/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
var bullet_instance = instance_create_layer(x, y, "Instances_1", obj_bullet);
bullet_instance.direction = dir_to_player;
bullet_instance.speed = 1.2;
if(distance_to_object(obj_player) <=30){
alarm[0] = room_speed * 4;
}