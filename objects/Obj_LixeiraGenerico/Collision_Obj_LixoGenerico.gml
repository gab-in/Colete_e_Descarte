//Apaga o lixo quando você o larga em cima da colisão da lixeira
if(mouse_check_button_released(mb_left)){
	instance_destroy(other);
	
	//Sistemas de calcular erro e acerto
	if(other.tipoIdentificador!=self.tipoIdentificador){
		global.erros1+=1;
	}

	else{
		global.acertos1+=1;

	}
}

