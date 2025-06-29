// Inherit the parent event
event_inherited();
array_push(global.Jogadores, global.JogadorAtual); //Salva dados do usuário atual
global.jogadorAtual = undefined; //Reseta vetor do usuário atual
global.nome = "";	//Reseta caixa de entrada
keyboard_string = "";	//Reseta buffer do teclado
room_goto(Tela_nome);	//Troca para a tela de entrada de nome

