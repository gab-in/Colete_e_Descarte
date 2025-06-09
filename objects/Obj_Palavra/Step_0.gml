//Desconta pontuacao por minuto passado A PARTIR dos 5 minutos
if(Obj_Tempo.segundosPassados>300){	//300 segundos  == 5 minutos
	var minuto=(Obj_Tempo.segundosPassados%60);	//A cada minuto apos 5 min
	if(minuto==0 && pontuacao>0){
		pontuacao-=50;	//Desconta 50 pontos, só se ainda não tá zerado
	}
}

if(!tentativaPermitida) exit;	//Isso aqui só serve se você conseguiu acertar a palavra

if(position_meeting(mouse_x,mouse_y,Obj_Palavra)){
	cursor_sprite=Spr_MouseAgarrando;	
}
else if(cursor_sprite!=Spr_MouseAgarrando){
	cursor_sprite=Spr_MouseNormal;	
}

if(selecionada){				//Isso aqui serve para escrever só na linha selecionada
	var char=keyboard_lastchar;	//Vou tentar mover isso mais para baixo
	
	//
	//Verifica se pressionou para apagar
	if(keyboard_check_pressed(vk_backspace)){
		//
		var celulaAtual,encontrouCelulaEditavel=false;		//Variaveis de apoio
		//Loop para pular variáveis que já estão corretas
		while(!encontrouCelulaEditavel && (celulaX>0 || celulaY>0)){
			//
			if(celulaX>0 && tipo==TipoCelula.Horizontal){
				celulaX--;
			}
			else if(celulaY>0 && tipo==TipoCelula.Vertical){
				celulaY--;
			}//Fecha else if
			
			celulaAtual=grade[celulaX][celulaY];			//Proxima Celula
			//Se o estado dessa nova celula não tiver estadoCelula.Certo, então a var recebe "true"
			if(celulaAtual.estado!=estadoCelula.Certo){encontrouCelulaEditavel=true}
		}//fecha while
		
		//Se deu certo e achou uma celula editável, apaga ela
		//Mas claro diferencia das células que são compartilhadas
		if(encontrouCelulaEditavel && celulaAtual.tipo!=TipoCelula.Compartilhada){
			celulaAtual.char="";
		}
		else if(encontrouCelulaEditavel && celulaAtual.tipo==TipoCelula.Compartilhada){
			celulaAtual.Sincronizar("", estadoCelula.Neutro); //Método criado em Scrt_Classes
		}
	}//fecha condicional de dectar backspace
	
	//
	//Enter = Terminou a palavra e quer testar se está certo
	if(keyboard_check_pressed(vk_enter)){
		checarPalavra();					//checarPalavra(); tá escrita no evento Criar deste objeto
	}
	
	//
	//Apertei qualquer coisa no teclado, então ele vai tentar ler
	else if((keyboard_check_pressed(vk_anykey))){
		 //string_letters le as letras inseridas, para ver se realmente foi digitado algo
		if(string_letters(char)!=""){
			//
			var proximaCelula, encontrouProximaCelula=false;		//Variaveis para apoio
			
			/*AS PROXIMAS 3 LINHAS FAZEM PARTE DA CONDICIONAL DO WHILE*/
			while(!encontrouProximaCelula &&						//Verifica se já encontrou celula valida
			((celulaX<width && tipo==TipoCelula.Horizontal) ||		//Verifica é cel. compart. || pode increm.
			(celulaY<height && tipo==TipoCelula.Vertical))){		//	^	^	^	^	^	^	^	^	^	^
			/*----------------FIM DA CONDICIONAL DO WHILE--------------------*/
				//
				//Começa o método para palavra Horizontal
				if(tipo==TipoCelula.Horizontal && celulaX<width){	//Checa a palavra
					proximaCelula=grade[celulaX][celulaY];			//proximaCelula=posicao na grade
				
					if(proximaCelula.estado!=estadoCelula.Certo){	//Checa se dá para editar
						encontrouProximaCelula=true					//Se sim, termina o loop
						break;
					}
					
					celulaX++; //Isso aqui passa a próxima letra, caso a Celula atual não de para editar
				}//Fecha o método para palavra Horizontal
				
				//
				//Começa o método para palavra Vertical 
				else if(tipo==TipoCelula.Vertical && celulaY<height){	//
					proximaCelula=grade[celulaX][celulaY];				//proximaCelula=posicao na grade
				
					if(proximaCelula.estado!=estadoCelula.Certo){		//Checa se dá para editar
						encontrouProximaCelula=true						//Se sim, termina o loop
						break;
					}
		
					celulaY++; //Isso aqui passa a próxima letra
				}//Fecha o método para palavra
			}//FECHA O WHILE
			
			//
			//55 do segundo tempo, adicionar a letrra finalmente e passar para a próxima
			if(encontrouProximaCelula){			//Validação
				//Diferenciar celula compartilhada
				if(proximaCelula.tipo!=TipoCelula.Compartilhada){
					proximaCelula.char=string_upper(char);	//string_upper() = Tudo que digitar -> maiusculo
				}
				else if(proximaCelula.tipo==TipoCelula.Compartilhada){
					proximaCelula.Sincronizar(string_upper(char), estadoCelula.Neutro); //Método criado em Scrt_Classes
				}
				//
				//Avança para a próxima Celula
				if(tipo == TipoCelula.Horizontal && celulaX < width) {
                    celulaX++;
                }
                else if(tipo == TipoCelula.Vertical && celulaY < height) {
                    celulaY++;
                }
			}
		}//fecha if(string_letters)
	}//fecha else if (pressionou qualquer tecla)
}//feha if(selecionada)