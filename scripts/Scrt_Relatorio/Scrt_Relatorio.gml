function Scrt_Relatorio(){
	//Resgata os valores de acertos e erros
	var acertos=0,erros=0,tempo=0, pontuacao=0;	//As variáveis foram iniciadas só por garantia
	
	//Caso exista instance de LixoGenerico, então estamos lidando com a fase 1
	if(instance_exists(Obj_LixeiraGenerico)){
		acertos=global.acertos;
		erros=global.erros;
		pontuacao=global.pontuacao;
	}
	
	//Caso exista instance de Palavra, então estamos lidando com a fase 2
	if(instance_exists(Obj_Palavra)){
		acertos=global.acertos;
		
		//Na hora de colocar o relatório, erros deve ser interpretado como o numero de tentativas 
		//antes de acertar a palavra
		erros=global.erros;
		pontuacao=global.pontuacao;
	}
	
	if(instance_exists(Obj_Tempo)){
		tempo=Obj_Tempo.segundosPassados;
	}
	
	//Salva a sala que a gente tá atualmente
	var salaNome, salaId;
	
	salaNome=room_get_name(room);
	salaId=room;
	
	//Coloca tudo no array global
	array_push(global.JogadorAtual.resultados,{
				salaNome: salaNome,
				salaId:	salaId,
				acertos: acertos,
				erros: erros,
				tempo: tempo,
				pontuacao: pontuacao});
}


// Função para desenhar a tabela
function desenhar_tabela() {
FONTE_PADRAO = ft_padrao;  // Substitua pela sua fonte
TAMANHO_FONTE = 12;
COR_TEXTO = c_black;         // Cor do texto
COR_LINHAS = c_gray;         // Cor das linhas da tabela
ESPACAMENTO_X = 20;          // Espaçamento horizontal entre células
ESPACAMENTO_Y = 50;           // Espaçamento vertical entre células
POSICAO_X_INICIAL = 192;     // Posição X inicial da tabela
POSICAO_Y_INICIAL = 224;     // Posição Y inicial da tabela
LARGURA_COLUNAS = [250, 150, 150, 150, 150, 150, 150, 150]; // Larguras das colunas

// Pega o jogador da página atual
// Dados da tabela (substitua por suas variáveis/arrays)
// Inicializa a tabela com o cabeçalho
dados_tabela = [
    ["Jogador", "Fase", "Nivel", "Acertos", "Erros", "Tempo", "Pontuacao"]
];
   // Preenche a tabela com dados de todos os jogadores e seus resultados
    for (var j = 0; j < array_length(global.Jogadores); j++) {
        var jogador = global.Jogadores[j];

        for (var i = 0; i < array_length(jogador.resultados); i++) {
            var r = jogador.resultados[i];

            // Determina fase e nível
            var fase = 1;
            var nivel = 1;
            if (r.salaId == Rm_Cruzadinha) {
                fase = 2;
                nivel = 1;
            } else {
                fase = 1;
                if (r.salaId == Rm_ColeteDescarte_1) nivel = 1;
                if (r.salaId == Rm_ColeteDescarte_2) nivel = 2;
                if (r.salaId == Rm_ColeteDescarte_3) nivel = 3;
            }
			//Coloca a primeira Letra em maiusculo

            array_push(dados_tabela, [
                jogador.nome,
                fase,
                nivel,
                string(r.acertos),
                string(r.erros),
                string(r.tempo),
                string(r.pontuacao)
            ]);
        }
    }
	// Também exibe o jogador atual, mesmo que ainda não tenha sido salvo
if (variable_global_exists("JogadorAtual")) {
    var jogador = global.JogadorAtual;

    for (var i = 0; i < array_length(jogador.resultados); i++) {
        var r = jogador.resultados[i];

        var fase = 1;
        var nivel = 1;
        if (r.salaId == Rm_Cruzadinha) {
            fase = 2;
            nivel = 1;
        } else {
            if (r.salaId == Rm_ColeteDescarte_1) nivel = 1;
            if (r.salaId == Rm_ColeteDescarte_2) nivel = 2;
            if (r.salaId == Rm_ColeteDescarte_3) nivel = 3;
        }

        array_push(dados_tabela, [
            jogador.nome,
            fase,
            nivel,
            string(r.acertos),
            string(r.erros),
            string(r.tempo),
            string(r.pontuacao)
        ]);
    }
}

	var totalLinhas = array_length(dados_tabela) - 1; // Menos 1 por causa do cabeçalho
	global.totalPaginas = max(1,ceil(totalLinhas / linhasPorPagina));
    // Desenha a tabela na tela
    draw_set_font(FONTE_PADRAO);
    draw_set_color(COR_TEXTO);

    var x_atual = POSICAO_X_INICIAL;
    var y_atual = POSICAO_Y_INICIAL;

	for (var coluna = 0; coluna < array_length(self.dados_tabela[0]); coluna++) {
	    draw_text(x_atual + ESPACAMENTO_X, y_atual + ESPACAMENTO_Y, self.dados_tabela[0][coluna]);
	    x_atual += LARGURA_COLUNAS[coluna];
	}

	// Avança a posição Y antes de desenhar as linhas de dados
	y_atual += TAMANHO_FONTE + 2 * ESPACAMENTO_Y;

	var inicioLinha = 1 + paginaAtual * linhasPorPagina;
	var fimLinha = inicioLinha + linhasPorPagina;

	// Garante que não vai ultrapassar o tamanho do array
	if (fimLinha > array_length(dados_tabela)) {
	    fimLinha = array_length(dados_tabela);
	}

   for (var linha = inicioLinha; linha < fimLinha; linha++) {
    x_atual = POSICAO_X_INICIAL;

    for (var coluna = 0; coluna < array_length(dados_tabela[linha]); coluna++) {
        draw_text(x_atual + ESPACAMENTO_X, y_atual + ESPACAMENTO_Y, dados_tabela[linha][coluna]);
        x_atual += LARGURA_COLUNAS[coluna];
    }

    y_atual += TAMANHO_FONTE + 2 * ESPACAMENTO_Y;	
}
	// Desenhar número da página
	var textoPagina = "Pagina " + string(paginaAtual + 1) + " / " + string(global.totalPaginas);

	// Calcula posição central horizontal abaixo da tabela
	var larguraTotal = 0;
	for (var i = 0; i < array_length(LARGURA_COLUNAS); i++) {
	    larguraTotal += LARGURA_COLUNAS[i];
	}

	var posX_central = POSICAO_X_INICIAL + (larguraTotal / 2) - (string_width(textoPagina) / 2);
	var posY_rodape = display_get_height()-300;  // Espaço extra abaixo da última linha da tabela

	draw_text(posX_central, posY_rodape, textoPagina);
}
