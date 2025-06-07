/*
*	Se o objeto for clicado (Então tá tentando ser arrastado), faz as coisas
*	se não, ele só fica no lugar
*/

if(clique){
	novo_x+=(mouse_x - mouse_x0);	//delta x
	novo_y+=(mouse_y - mouse_y0);	//delta y
	
	x=novo_x-offset_x;				//Atualização direta das coordenadas x do objeto
	y=novo_y-offset_y;				//	^	^	^	^	^	^	^	^	 y	^	^
	
	mouse_x0=mouse_x;				//Atualização da coordenada antiga
	mouse_y0=mouse_y;				//Atualização da coordenada antiga
}

if(mouse_check_button_released(mb_left)){
	/*
	*	Agora sim, esse é o evento de soltar o botão esquerdo do mouse
	*/

	clique=false;				//Não tem muito o que fazer, é só desativar a função de arrastar	
	
	cursor_sprite=Spr_MouseNormal;	//Volta o mouse para o normal
	/*
	*	Reseta o valor de novo_x sempre que você para de arrastar; Isso deve ser feito porque caso contrário
	*	o valor de novo_x começa e criar uma distância bizarra entre o (x,y) inicial do objeto e o mouse quanto
	*	mais você arrasta e solta objetos
	*	Eventualmente essa distância faz o objeto ficar longe do mouse ao arrastar, e cria um bug onde o objeto
	*	não desgruda do mouse; (Pois o evento de esquerda liberada só é válido em cima do objeto)
	*/
	novo_x=x;
	novo_y=y;
	
	image_xscale = 1;	//Volta o tamanho do sprite ao normal
	image_yscale = 1;	//	^	^	^	^	^	^	^	^
}