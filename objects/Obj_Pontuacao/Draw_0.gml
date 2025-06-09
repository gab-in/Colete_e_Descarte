draw_self();

draw_set_font(Font_Cruzadinha);
//Centraliza o texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,global.pontuacao);