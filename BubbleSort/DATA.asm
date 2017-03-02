 ; The result is : -111, -7, 0, 3, 12, 18, 34, 45, 67, ,87, 99
 ;           xFF91, xFFD9, x0000, x0003, x000c, x0022, x002D, x0043, x0057, x0063
 ;
			.ORIG	x3100
	DATAPTR		.FILL	#99	; x3101->x0063
			.FILL	#-7 	; x3102->xFFD9
			.FILL	#12	; x3103->x0x0C
			.FILL	#45	; x3104->x002D
			.FILL	#87 	; x3105->x0057
			.FILL	#-111 	; x3106->x806F
			.FILL	#67	; x3107->x0043
			.FILL	#3 	; x3108->x0003
			.FILL	#0 	; x3109->x0000
			.FILL 	#18 	; x310A->x0012
			.FILL	x0004	; x310B->x0004
			.END