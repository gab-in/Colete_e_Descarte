draw_self();	//Desenha retangulo

global.nome=keyboard_string;


//Desenhando na tela
draw_set_font(Font_Cruzadinha);		//Letra
draw_set_halign(fa_center);			//
draw_set_valign(fa_middle);			//
draw_set_color(c_black);			//
draw_text(840, 525, global.nome);	//