// Evento Step (volta ao original)
if (selecionada) {
    // Se 'selecionada' é true, celulaSelecionadaX e Y DEVEM ser válidos agora
    var celula = grade[celulaSelecionadaX][celulaSelecionadaY];

    // Só permite editar se a célula ainda não estiver certa
    if (celula.estado != estadoCelula.Certo) {

        // Se o jogador apertar backspace, apaga a letra
        if (keyboard_check_pressed(vk_backspace)) {
            if (celula.tipo != TipoCelula.Compartilhada) {
                celula.char = "";
                celula.estado = estadoCelula.Neutro; // Já está aqui, mas é importante para o debug.
            } else {
                celula.Sincronizar("", estadoCelula.Neutro); // Já está aqui, mas é importante para o debug.
            }
            show_debug_message("DEBUG: Backspace pressionado. Chamando checarPalavra().");
            checarPalavra();
            show_debug_message("DEBUG: Após backspace e checarPalavra(). Célula selecionada estado: " + string(celula.estado));
        }

        // Só permite digitar uma nova letra se a célula estiver vazia
        if (celula.char == "") {
            if (keyboard_check_pressed(vk_anykey)) {
                var char = keyboard_lastchar;

                if (string_letters(char) != "") {
                    var letra = string_upper(char);

                    if (celula.tipo != TipoCelula.Compartilhada) {
                        celula.char = letra;
                        celula.estado = estadoCelula.Neutro; // Já está aqui, mas é importante para o debug.
                    } else {
                        celula.Sincronizar(letra, estadoCelula.Neutro); // Já está aqui, mas é importante para o debug.
                    }
                    show_debug_message("DEBUG: Tecla digitada: '" + letra + "'. Chamando checarPalavra().");
                    checarPalavra();
                    show_debug_message("DEBUG: Após digitar e checarPalavra(). Célula selecionada estado: " + string(celula.estado));
                }
            }
        }
    }
}