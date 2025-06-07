/*
*	Tudo isso aqui só serve para desenhar os quadrados onde vão ficar cada letra
*/
for(var i=0;i<width;i++){
	for(var j=0;j<height;j++){
		var desenharX = x + i * (celulaTam);
		var desenharY = y + j * (celulaTam);
		
		//Isso aqui chama a função Desenhar
		var celula =grade[i][j]
		celula.Desenhar(desenharX,desenharY,celulaTam);
		
		//Desenhozinho dos quadrados
		draw_rectangle(desenharX, desenharY, (desenharX+celulaTam-1.5), (desenharY+celulaTam-1.5), true);
	}
}