//Definições Essenciais
palavraCerta="PAPEL";
width=5;
height=1;
tipo=TipoCelula.Horizontal;

// Inherit the parent event
event_inherited();

//Definir letra compartilhada
//Primeira interseção
var intersecao1=grade[1][0];
intersecao1.tipo=TipoCelula.Compartilhada;

intersecao1.palavrasPai = [];
intersecao1.palavrasPai[0] = id;
intersecao1.palavrasPai[1] = Obj_Palavra_Lata;

Obj_Palavra_Lata.grade[0][3]=intersecao1;

//Segunda intersecao
var intersecao2=grade[4][0];
intersecao2.tipo=TipoCelula.Compartilhada;

intersecao2.palavrasPai = [];
intersecao2.palavrasPai[0] = id;
intersecao2.palavrasPai[1] = Obj_Palavra_Sacola;

Obj_Palavra_Sacola.grade[0][4]=intersecao2;

//Definir letras antes de começar
var letra=grade[1][0];//Letra A
letra.Sincronizar("A", estadoCelula.Certo);