function Scrt_Relatorio(){
	global.Resultados=[];
	
	//Resgata os valores de acertos e erros
	var acertos=0,erros=0,tempo=0, pontuacao=0;	//As variáveis foram iniciadas só por garantia
	
	//Caso exista instance de LixoGenerico, então estamos lidando com a fase 1
	if(instance_exists(Obj_LixeiraGenerico)){
		acertos=Obj_LixeiraGenerico.acertos;
		erros=Obj_LixeiraGenerico.erros;
		pontuacao=global.pontuacao;
	}
	
	//Caso exista instance de Palavra, então estamos lidando com a fase 2
	if(instance_exists(Obj_Palavra)){
		acertos=global.acertos;
		
		//Na hora de colocar o relatório, erros deve ser interpretado como o numero de tentativas 
		//antes de acertar a palavra
		erros=Obj_Palavra.tentativas;
		pontuacao=global.pontuacao;
	}
	
	if(instance_exists(Obj_Tempo)){
		tempo=Obj_Tempo.segundosPassados;
	}
	
	//Salva a sala que a gente tá atualmente
	var salaNome, salaId;
	
	salaNome=room_get_name(room);
	salaId=room;
	
	//Coloca tudo no array global
	array_push(global.Resultados,{
				salaNome: salaNome,
				salaId:	salaId,
				acertos: acertos,
				erros: erros,
				tempo: tempo,
				pontuacao: pontuacao});
}