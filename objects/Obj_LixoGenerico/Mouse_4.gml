/*
*	Isso aqui só é ativado literalmente quando o aluno aperta o botão esquerdo
*	Isso se refere SOMENTE A APERTAR. Soltar o botão é outro evento
*/
mouse_x0=x;						//Recebe a coordenada no mouse no momento que clica (X inicial)
mouse_y0=y;						//	^	^	^	^	^	^	^	^	^	^	^	^	(Y inicial)

offset_x=mouse_x-mouse_x0;		//Cálculo da distância original entre as coordenadas do objeto e o mouse
offset_y=mouse_y-mouse_y0;		//	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^

cursor_sprite=Spr_MouseAgarrando;	//Isso aqui é só para deixar o mouse mais bonitinho

/*
*	Solução para mexer lixos que estão em cima um do outro
*/
var instanceTopo=noone;	//noone==NULL
var depthTopo=10000;	//depth==distância da tela (quanto menor, mais a frente)

/*
*	with() é literalmente a função mais importante e quebrada do GML
*	* Mexe em todas as instances de um objeto em tempo real
*	* Consegue mexer em varíaveis de instances ESPECÍFICAS, sem mexer no resto
*/

with(Obj_LixoGenerico){
	//Se tá mais atrás da tela que a instance anteriormente guardada, e o mouse tá em cima
    if(depth < depthTopo && position_meeting(mouse_x, mouse_y, self)) {
		depthTopo=depth;	//Todas as varíaveis em verde referem-se à instance ATUAL
		instanceTopo=id;	//id== numero unico identificador de instances
    }
}

if(instanceTopo){							//Se não for válida, então eu nem cliquei em nenhum objeto
	global.depthContador+=1;				//Quantas vezes uma variável foi trazida a frente
	
    with(instanceTopo){	
        clique=true;						//Permite a função de arrastar de acontecer
		
		depthOffset=global.depthContador;	//Autoexplicativo
		depth=depthBase-depthOffset;		//Nova depth com o offset
		
		image_xscale = 1.5;
		image_yscale = 1.5;
    }
}
