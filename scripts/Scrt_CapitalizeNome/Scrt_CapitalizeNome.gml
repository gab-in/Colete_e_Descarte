function string_capitalize_nome(str) {
    var partes = string_split(str, " ");
    var resultado = "";

    for (var i = 0; i < array_length(partes); i++) {
        var parte = partes[i];
        if (string_length(parte) > 0) {
            var primeira = string_upper(string_copy(parte, 1, 1));
            var resto = string_copy(parte, 2, string_length(parte));
            resultado += primeira + resto;
        }
        if (i < array_length(partes) - 1) {
            resultado += " ";
        }
    }

    return resultado;
}