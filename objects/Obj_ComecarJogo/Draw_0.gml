// Inherit the parent event
event_inherited();

// Desenha a mensagem de aviso, se necessário
if (aviso) {
    draw_set_font(Font_Cruzadinha);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text(x, y+100, "Digite seu nome antes de continuar.");
}

//Desenhando na tela
draw_set_font(ft_padrao);		//Letra
draw_set_halign(fa_right);			//
draw_set_valign(fa_middle);			//
draw_set_color(c_black);			//
draw_text(x+20,y, "ENTRAR");	//


