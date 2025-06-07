function Celula() constructor{
	char="";					//Guarda a letra inserida
	estado=estadoCelula.Neutro;	//Pode ser certo ou errado
	palavrasPai=[];				//Armazenar referências às palavras que compartilham esta celula
	tipo=noone;
	
	/*
	*	Isso aqui vai dar cor para os quadrados, ESSA é a função desenhar
	*/
	static Desenhar = function (pamX, pamY, pamTam){	//pamX == Parametro X ; pamY == Parametro Y
		//Isso aqui coloca corzinha no retângulo
		var cor = global.cores[estado];	//Cor recebe uma cor dependendo do estado
		draw_set_color(cor);
		draw_rectangle(pamX,pamY,(pamX+pamTam),(pamY+pamTam),false);
		
		//Cor do texto
		draw_set_color(c_white);
		//Usa a fonte que tem dentro do arquivo ali
		draw_set_font(Font_Cruzadinha);
		//Centraliza o texto
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		//Isso aqui desenha o caractere inserido
		draw_text((pamX + pamTam/2),(pamY + pamTam/2),char);//Importantíssimo para outras coisas no jogo inclusive
		
		//retorna para o padrão
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
	
	/*Código em Beta para resolver a parte de celulas compartilhadas
			static AdicionarPalavrasCompartilhada=function(palavraRef){
				array_push(palavrasPai,palavraRef);
			}
	*/
	static Sincronizar=function(novoChar, novoEstado){
		char=novoChar;
		estado=novoEstado;
		//Sincroniza com todas as palavras que compartilham esta celula
		for(var i=0;i<array_length(palavrasPai);i++){				//Se der problema, usar: "array_length(palavrasPai)"
		//Isso aqui não podia ser um 2?
			var palavra=palavrasPai[i];								//Le a palavra
			
			if (instance_exists(palavra)) {
			//
				for(var a=0;a<palavra.width;a++){					//for(x)
					for(var b=0;b<palavra.height;b++){				//for(y)
						//
						if(palavra.grade[a][b]==self){				//Procura celula compartilhada
							palavra.grade[a][b].char=novoChar;		//Sincronizadamente atualiza char
							palavra.grade[a][b].estado=novoEstado;	//	^	^	^	^	^	^	estado
							break;
						}//Fecha if(é a celula compartilhada?)
					}//Fecha for (y)
				}//Fecha for(x)
			}
			
		}//Fecha for(palavras que compartilham )
	}//Fecha Método
	/*----------------------------------------------------------*/
}//Fecha Struct/Construtor
/*
*	Definição de novos valores para escrever bonitinho ao invés de "0, 1"
*/
enum estadoCelula{
	Certo,
	Errado,
	Neutro	//Não tenho certeza ainda se preciso disso
}
enum TipoCelula{
	Horizontal,
	Vertical,
	Compartilhada
}

/*
*	Definição de cores
*	Se as cores estiverem muito fortes: merge_colour(c_cor1,c_cor2,x); x é um valor de intensidade
*/
global.cores[estadoCelula.Certo]=c_green;
global.cores[estadoCelula.Errado]=c_red;
global.cores[estadoCelula.Neutro]=c_black;