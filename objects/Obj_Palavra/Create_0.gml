celulaTam=100;	//Tamanho do local onde vai ficar cada letra
celulaY=0;
celulaX=0;

celulaSelecionadaX = -1;
celulaSelecionadaY = -1;

tentativaPermitida=true;
selecionada=false;
/*
*	Estrutura da coisa 
*/
grade = [];

global.erros=0;
global.pontuacao=0;
global.acertos=0;

for(var i=0;i<=width;i++){
	for(var j=0;j<height;j++){
		grade[i][j]=new Celula(); //Chama a struct criada
	}
}

/*
*	Métodos
*/
checarPalavra = function(){
    var palavraFormada = "";
    var celula;

    for(var i = 0; i < string_length(palavraCerta); i++){
        if(tipo == TipoCelula.Horizontal){
            celula = grade[i][0];
        }
        else if(tipo == TipoCelula.Vertical){
            celula = grade[0][i];
        }

        var celChar = celula.char;
        palavraFormada += celChar;

        var letraCerta = string_char_at(palavraCerta, i + 1);

        // Adicione esta linha para depuração
        show_debug_message("DEBUG: Checando célula [" + string(i) + "], Char: '" + celChar + "', Certa: '" + letraCerta + "'");

        if(letraCerta == celChar){
            if(celula.tipo != TipoCelula.Compartilhada){
                celula.estado = estadoCelula.Certo;
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] definida como Certo.");
            }
            else{
                celula.Sincronizar(celChar, estadoCelula.Certo);
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] sincronizada como Certo.");
            }
        }
        else if(celChar == ""){
            if(celula.tipo != TipoCelula.Compartilhada){
                celula.estado = estadoCelula.Neutro;
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] definida como Neutro (vazia).");
            }
            else{
                celula.Sincronizar(celChar, estadoCelula.Neutro);
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] sincronizada como Neutro (vazia).");
            }
        }
        else { // celChar não é vazio e é diferente de letraCerta (letra errada)
            if(celula.tipo != TipoCelula.Compartilhada){
                celula.estado = estadoCelula.Errado;
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] definida como Errado (letra incorreta).");
            }
            else{
                celula.Sincronizar(celChar, estadoCelula.Errado);
                show_debug_message("DEBUG: -> Célula [" + string(i) + "] sincronizada como Errado (letra incorreta).");
            }
            errou();
        }
        // Adicione esta linha para depuração
        show_debug_message("DEBUG: Estado final da célula [" + string(i) + "]: " + string(celula.estado));
    }

    if(palavraFormada == palavraCerta){
        acertou();
    }
}


acertou=function(){
	if(!foiContabilizada){
		foiContabilizada = true;
		global.acertos+=1;
		global.pontuacao+=200;
	}
	tentativaPermitida=false;
}
errou=function(){
	global.erros+=1;
}
