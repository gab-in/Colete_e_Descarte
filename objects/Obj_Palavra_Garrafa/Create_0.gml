//Definições Essenciais
palavraCerta="GARRAFA";
width=7;
height=1;
tipo=TipoCelula.Horizontal;

// Inherit the parent event
event_inherited();

//Definir letra compartilhada
//Primeira intersecao
var intersecao1=grade[1][0];
intersecao1.tipo=TipoCelula.Compartilhada;

intersecao1.palavrasPai = [];
intersecao1.palavrasPai[0] = id;
intersecao1.palavrasPai[1] = Obj_Palavra_Caixa;

Obj_Palavra_Caixa.grade[0][4]=intersecao1;

//Segunda intersecao
var intersecao2=grade[6][0];
intersecao2.tipo=TipoCelula.Compartilhada;

intersecao2.palavrasPai = [];
intersecao2.palavrasPai[0] = id;
intersecao2.palavrasPai[1] = Obj_Palavra_Lata;

Obj_Palavra_Lata.grade[0][4]=intersecao2;

//Letras prontas desde o inicio para ajudar
var letra=grade[2][0];//Letra R
letra.char="R"
letra.estado=estadoCelula.Certo;

letra=grade[5][0];//Letra F
letra.char="F"
letra.estado=estadoCelula.Certo;