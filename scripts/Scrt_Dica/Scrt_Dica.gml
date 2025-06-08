function Scrt_Dica(){
	var celulasValidas=[];	
	
	//Enquanto tiver instance, roda
	with(Obj_Palavra){
		var instance=id;
		
		for(var i=0;i<instance.width;i++){			//x na grade
			for(var j=0;j<instance.height;j++){		//y na grade
				var celula=instance.grade[i][j];	//celula atual
				
				//Pega a posição da letra certa e dai a própria letra
				var posicaoChar=(instance.tipo == TipoCelula.Horizontal ? i : j) + 1;
				var charCorreto=string_char_at(instance.palavraCerta,posicaoChar);
				
				//Só faz algo se a celula ainda não tá certa
				if(celula.estado!=estadoCelula.Certo){
					array_push(celulasValidas,{
								instance: instance,
								celula: celula,
								i: i,
								j: j,
								charCorreto: charCorreto
					});//Fecha array_push
				}//Fecha condicional
				
			}//Fecha Primeiro for
		}//Fecha Segundo for
	}//Fecha o with
	
	//
	if(array_length(celulasValidas)>0){
		return celulasValidas[irandom(array_length(celulasValidas) - 1)];
	}//fecha if
	
	return noone;
}//Fecha função