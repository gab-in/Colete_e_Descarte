//Definições Essenciais
palavraCerta="LATA";
width=1;
height=4;
tipo=TipoCelula.Vertical;

// Inherit the parent event
event_inherited();

//Definir letra compartilhada
//Primeira interseção
var intersecao1=grade[0][1];
intersecao1.tipo=TipoCelula.Compartilhada;

intersecao1.palavrasPai = [];
intersecao1.palavrasPai[0] = id;
intersecao1.palavrasPai[1] = Obj_Palavra_Garrafa;

Obj_Palavra_Garrafa.grade[6][0]=intersecao1;

//Segunda intersecao
var intersecao2=grade[0][3];
intersecao2.tipo=TipoCelula.Compartilhada;

intersecao2.palavrasPai = [];
intersecao2.palavrasPai[0] = id;
intersecao2.palavrasPai[1] = Obj_Palavra_Papel;

Obj_Palavra_Papel.grade[1][0]=intersecao2;