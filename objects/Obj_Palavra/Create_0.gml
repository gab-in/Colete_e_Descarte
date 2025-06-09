celulaTam=100;	//Tamanho do local onde vai ficar cada letra
celulaY=0;
celulaX=0;

tentativaPermitida=true;
selecionada=false;
/*
*	Estrutura da coisa 
*/
grade = [];

tentativas=0;
pontuacao=0;
acertos=0;

for(var i=0;i<=width;i++){
	for(var j=0;j<height;j++){
		grade[i][j]=new Celula(); //Chama a struct criada
	}
}

/*
*	Métodos
*/
checarPalavra = function(){
	var palavraFormada="",celula;
	for(var charI=0;charI<string_length(palavraCerta);charI++){
		//De novo, isso só funciona na horizontal, vou ter que adaptar para vertical
		//celula=grade[i][1], recebe struct do vetor, dentro da grade da palavra, andando no eixo X,
		if(tipo==TipoCelula.Horizontal){celula = grade[charI][celulaY];}
		if(tipo==TipoCelula.Vertical){celula = grade[celulaX][charI];}
		//celChar recebe a letra guardada dentro da struct atual em grade[i][1]
		var celChar = celula.char;
		//Ao final do loop palavaFormada contem toda palavra deste espaço
		palavraFormada+=celChar;
		
		/*
		*	Checar se tá certo
		*	string_char_at pega o char de 1 em 1 na palavra, mas o parâmetro da posição não pode ser 0
		*	logo: charI+1
		*/
		var letraCerta= string_char_at(palavraCerta,charI+1);
		if(letraCerta==celChar){
			if(celula.tipo!=TipoCelula.Compartilhada){
				celula.estado=estadoCelula.Certo;
			}
			if(celula.tipo==TipoCelula.Compartilhada){
				celula.Sincronizar(celChar, estadoCelula.Certo);
			}
		}
		else{
			if(celula.tipo!=TipoCelula.Compartilhada){
				celula.estado=estadoCelula.Errado;
			}
			if(celula.tipo==TipoCelula.Compartilhada){
				celula.Sincronizar(celChar, estadoCelula.Errado);
			}
		}
	}
	
	//Palavra certa.....
	if(palavraFormada==palavraCerta){
		acertou();
	}
	else{
		errou();
	}
}

acertou=function(){
	tentativaPermitida=false;
	acertos++;
	
	pontuacao+=200;
}
errou=function(){
	tentativas+=1;
}
