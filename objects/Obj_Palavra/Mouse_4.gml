// 1. Encontra qual palavra foi clicada
var clicado = instance_position(mouse_x, mouse_y, Obj_Palavra);

// 2. Calcula célula clicada considerando a posição da palavra atual (em relação à palavra clicada)
// Estes valores são relativos à instância 'clicado', se houver.
var clickedX_local = -1; // Usamos _local para evitar conflito com 'clickedX' do 'with(clicado)'
var clickedY_local = -1;

if (clicado) {
    clickedX_local = floor((mouse_x - clicado.x) / celulaTam);
    clickedY_local = floor((mouse_y - clicado.y) / celulaTam);
}

// 3. Itera sobre TODAS as palavras para desselecionar e resetar estados.
with (Obj_Palavra) {
    // Se esta instância estava selecionada antes, tente resetar a célula anterior
    if (selecionada) {
        if (celulaSelecionadaX >= 0 && celulaSelecionadaY >= 0) {
            var celAnt = grade[celulaSelecionadaX][celulaSelecionadaY];
            // --- MUDANÇA AQUI ---
            // A célula anterior só volta para Neutro se não estiver Certa OU Errada
			
            if (celAnt.estado != estadoCelula.Certo && celAnt.estado != estadoCelula.Errado) {
            // --- FIM DA MUDANÇA ---
                if (celAnt.tipo != TipoCelula.Compartilhada) {
                    celAnt.estado = estadoCelula.Neutro;
                } else {
                    celAnt.Sincronizar(celAnt.char, estadoCelula.Neutro);
                }
            }
        }
    }
    // Sempre resetar a seleção e os índices para -1 para esta instância
    selecionada = false;
    celulaSelecionadaX = -1;
    celulaSelecionadaY = -1;
}
// 4. Se clicou numa palavra VÁLIDA, processa a seleção
if (clicado && mouse_check_button_pressed(mb_left)) {
    with (clicado) {
        // Valida se o clique está dentro da grade da palavra Clicada
        if (clickedX_local >= 0 && clickedX_local < width && clickedY_local >= 0 && clickedY_local < height) {
            selecionada = true; // Define selecionada como true para a palavra clicada
            celulaSelecionadaX = clickedX_local;
            celulaSelecionadaY = clickedY_local;

            var celula = grade[clickedX_local][clickedY_local];

            // --- MUDANÇA AQUI ---
            // Só seleciona como 'Selecionado' se NÃO estiver Certa E NÃO estiver Errada.
            // Se estiver Errada, queremos que ela continue Errada mas esteja "selecionável" para edição.
            // Apenas para fins de edição (digitar/apagar), mas o estado visual é de erro.
            if (celula.estado != estadoCelula.Certo && celula.estado != estadoCelula.Errado) {
            // --- FIM DA MUDANÇA ---
                if (celula.tipo != TipoCelula.Compartilhada) {
                    celula.estado = estadoCelula.Selecionado;
                } else {
                    celula.Sincronizar(celula.char, estadoCelula.Selecionado);
                }
            }
            // Se a célula já estiver em estado.Errado, ela permanece em estado.Errado
            // mas ainda estará 'selecionada' pela lógica acima (selecionada = true).
            // A cor é gerenciada pelo Draw Event, que deve priorizar Errado sobre Selecionado.
        }
    }
}