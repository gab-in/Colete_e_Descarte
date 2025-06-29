// Inherit the parent event
event_inherited();
if(string_length(string_trim(global.nome))>0){ //Verifica se o campo não esta em branco
	global.nome = string_copy(global.nome, 1, 12);//Atribui somente os 12 primeiros caracteres inseridos
	global.nome = string_lower(global.nome); //Garante tudo minúsculo para capitalizar depois
	global.nome = string_capitalize_nome(global.nome); //Função personalizada para capitalizar tudo

	global.JogadorAtual={
		nome: string_trim(global.nome),
		resultados: []
	}
	room_goto(Tela_inicio);	//Vai para a tela de inicio no jogo
} 
else aviso=true; //Se o campo de entrada estiver em branco, emite um aviso e impede que o jogo comece
