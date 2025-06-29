draw_self();					//Se desenhar yippie

// Configura fonte, cor e alinhamento
draw_set_font(ft_padrao);  // substitua pela sua fonte
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Desenha "Dica" no topo do objeto (centro horizontal, topo do sprite)
draw_text(x, y - sprite_height / 2 - 40, "Dica");

// Agora desenha "Restantes: <número>" embaixo do objeto
draw_set_valign(fa_bottom);
draw_text(x, y + sprite_height / 2 + 40, "Restantes: " + string(dicasDisponiveis));