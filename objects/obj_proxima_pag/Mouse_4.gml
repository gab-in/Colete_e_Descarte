// Inherit the parent event
event_inherited();

if(Obj_Relatorio.paginaAtual<(global.totalPaginas-1)){
	Obj_Relatorio.paginaAtual += 1;
}