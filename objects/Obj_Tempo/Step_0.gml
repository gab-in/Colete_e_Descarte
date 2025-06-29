/*
*	delta_time é a diferença entre o tempo do frame anterior e o tempo do frame atual	
*	o valor tá em microsegundos, por isso tem que dividir por 1 milhão
*/
segundosPassados+=delta_time/1000000;

afk += delta_time/1000000;

if(afk>=240){
	//Spawna instance de tela de aviso de afk
	instance_create_layer(room_width/2,room_height/2, "Assets_3", Obj_AvisoAFK);
	
	if(afk>=300){
		array_push(global.Jogadores, global.JogadorAtual);
		global.jogadorAtual = undefined;
		global.nome = "";
		keyboard_string = "";
		room_goto(Tela_nome);
	}
}

//Sempre que o jogador fizer algo reseta o timer
if (keyboard_check(vk_anykey) || mouse_x != last_mouse_x || mouse_y != last_mouse_y || mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
    afk = 0;

	instance_destroy(Obj_AvisoAFK);
	
}
last_mouse_x = mouse_x;
last_mouse_y = mouse_y;
