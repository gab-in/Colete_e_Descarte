/*
*	Esse objeto serve para guardar o código completo de funcionamento dos lixos do nível 1 do jogo
*/

clique=false;	//Isso aqui determina quando o lixo tá sendo arrastado ou não

mouse_x0=0;		//Recebe as primeiras coordenadas e depois as antigas para o cálculo do delta
mouse_y0=0;		//	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^

novo_x=x;		//Delta da posição do mouse nova e a antiga para atualização da coordenada do objeto
novo_y=y;		//	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^	^

/*
*	"offset" é a distância original entre o centro do objeto e o ponto (x,y) que o mouse clicou para arrastar
*	ele é adicionado à nova posição calculada para o objeto quando você o arrasta.
*	O objetivo disso, é realmente parecer que se está arrastando o objeto, ao invés dele grudar no mouse como um
*	imã de geladeira.
*/
offset_x=0;
offset_y=0;

/*
*	Essas variáveis servem somente para trazer o objeto que você clicou mais para frente em relação ao resto
*	Depth tem relação com a distância em relação a tela (quanto menor o valor, mais perto da tela)
*/
depthBase=depth;		//Salva a depth original dos objetos
depthOffset=0;			//Vai ser usada para manter a ordem do depth nova criada a cada clique
global.depthContador=0;	//Serve para dizer quantas vezes a ordem de depth foi alterada