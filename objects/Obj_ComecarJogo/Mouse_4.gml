// Inherit the parent event
event_inherited();
if(string_length(string_trim(global.nome))>0){
	global.nome = string_copy(global.nome, 1, 8);
	global.nome = string_lower(global.nome); // garante tudo minúsculo para capitalizar depois
	global.nome = string_capitalize_nome(global.nome); // nossa função customizada abaixo

	global.JogadorAtual={
		nome: string_trim(global.nome),
		resultados: []
	}
	room_goto(Tela_inicio);
}
else aviso=true;;
