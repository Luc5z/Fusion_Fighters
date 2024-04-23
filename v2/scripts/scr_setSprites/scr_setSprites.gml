// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function setSpriteAndando(_obj)
{
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = inimigo1_walk;
		break;
		
		case "obj_boss01":
			sprite = boss01_parado;
		break;
		
		case "obj_enemy_minhoca":
		
			sprite = minhoca;
			
		break;
		
		case "obj_boss_beyblade":
		
			sprite = boss_beyblade;
			
		break;
		
		case "obj_anjo":
		
			sprite = Demon_transform;
			
		break;
	}
	
	return sprite;
}

function setSpriteAtacando(_obj)
{
	
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = inimigo1_atacando;
		break;
		
		case "obj_boss01":
			sprite = boss_chute;
		break;
		
		case "obj_enemy_minhoca":
			sprite = minhoca;
		break;
		
	}
	
	
	return sprite;
	
}

function setSpriteDano(_obj)
{
	
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = inimigo1_damage;
		break;
		
		case "obj_boss01":
			sprite = boss01_parado;
		break;
		
	}
	
	
	return sprite;

}

function setSpriteMorte(_obj)
{
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = inimigo1_die;
		break;
		
		case "obj_boss01":
			sprite = boss_morte
		break;
		
	}
	
	
	return sprite;

}