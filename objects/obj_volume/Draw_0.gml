draw_sprite(spr_volumeBar,image_index,x,y);

var bola_amount= atual_amount/amount_max;

var posicao_bola= x+(sprite_width*bola_amount);

draw_sprite(spr_bolinha,0,posicao_bola,y)