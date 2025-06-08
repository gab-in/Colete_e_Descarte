emCima=position_meeting(mouse_x,mouse_y,Obj_Dica);	//Tô com o mouse em cima?

if(emCima && mouse_check_button_pressed(mb_left) && dicasDisponiveis>0){	//Cliquei?
	clicou=true;
	
	//Fazer o sprite diminuir de tamanho
	image_xscale = 0.5;
	image_yscale = 0.5;
	
	//Resolver a escolha aleatória de uma letra revelar
	var letraRevelada=Scrt_Dica();
	
	if(letraRevelada){
		letraRevelada.celula.char=letraRevelada.charCorreto;
		letraRevelada.celula.estado=estadoCelula.Certo;
		
		//Resolver para letra compartilhada
		if(letraRevelada.celula.tipo==TipoCelula.Compartilhada){
			letraRevelada.celula.Sincronizar(letraRevelada.charCorreto,estadoCelula.Certo);
		}
		
		dicasDisponiveis--;
	}
}

if(mouse_check_button_released(mb_left)){			
	clicou=false;
	//Volta para o tamanho normal
	image_xscale = 1.0;
	image_yscale = 1.0;
}//Fecha condicional de soltar o botão esquerdo