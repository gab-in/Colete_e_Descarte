//Apaga o lixo quando você o larga em cima da colisão da lixeira
if(mouse_check_button_released(mb_left)){
	instance_destroy(other);

	if(other.tipoIdentificador!=self.tipoIdentificador){
		global.erros++;
		
		global.pontuacao-=penalidade;
	}

	else{
		global.acertos++;

		global.pontuacao+=recompensa;
	}
	if(global.pontuacao<0){global.pontuacao=0;}		//Garante que não estoura o limmite minimo
	if(global.pontuacao>1000){global.pontuacao=1000;}	//Garante que não estoura o limite 
}

