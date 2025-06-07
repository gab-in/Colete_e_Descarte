//Definições essenciais:
palavraCerta="CAIXA";
width=1
height=5
tipo=TipoCelula.Vertical

// Inherit the parent event
event_inherited();

//Define especificamente qual letra da palavra vai ser compartilhada
var temp=grade[0][4];
temp.tipo=TipoCelula.Compartilhada;

temp.palavrasPai=[];
temp.palavrasPai[0]=id;
temp.palavrasPai[1]=Obj_Palavra_Garrafa;

Obj_Palavra_Garrafa.grade[1][0]=temp;