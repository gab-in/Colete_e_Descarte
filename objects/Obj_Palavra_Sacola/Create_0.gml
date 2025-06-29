//Definições Essenciais
palavraCerta="SACOLA";
width=1;
height=6;
tipo=TipoCelula.Vertical;
foiContabilizada=false;
// Inherit the parent event
event_inherited();

//Definir letra compartilhada
//Primeira interseção
var intersecao1=grade[0][4];
intersecao1.tipo=TipoCelula.Compartilhada;

intersecao1.palavrasPai = [];
intersecao1.palavrasPai[0] = id;
intersecao1.palavrasPai[1] = Obj_Palavra_Papel;

Obj_Palavra_Papel.grade[4][0]=intersecao1;

//Letras prontas desde o inicio para ajudar
letra=grade[0][0];//Letra S
letra.char="S"
letra.estado=estadoCelula.Certo;

letra=grade[0][4];//Letra L
letra.Sincronizar("L", estadoCelula.Certo);