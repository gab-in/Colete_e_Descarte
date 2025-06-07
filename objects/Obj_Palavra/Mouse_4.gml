var clicado;
//Encontra colisão com outra palavra
clicado=instance_position(x,y,Obj_Palavra)
with(Obj_Palavra){
	//Se tá mais atrás da tela que a instance anteriormente guardada, e o mouse tá em cima
    if((!clicado || depth < clicado.depth) && position_meeting(mouse_x, mouse_y, self)) {
		clicado=id;	//id== numero unico identificador de instances
    }
}

//Desseleciona todas as instance
with(Obj_Palavra){
	selecionada=false;
}
//Seleciona só a que quer (isso garante que só dá para escrever em um espaço por vez)
if(clicado){
	with(clicado){
		selecionada=true;
	}
}