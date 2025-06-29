if(puxado==true){
	if(mouse_x>x){
		var xx = abs(x-mouse_x);
		amount=xx/sprite_width;
		amount=clamp(amount,0,1);
		atual_amount=amount*100;
	}
	else{
		atual_amount=0;	
	}
}
