 ; Interrupt processing Program.
 ;
                   .ORIG	x1000	
		   ST		R0, StoreR0	;
		   JSR		NEWLINE
		   JSR		NEWLINE
                   LEA   	R0, INTINFO	; Output a string.
                   TRAP  	x22
		   JSR		NEWLINE
		   LEA		R0, ECHO	;
		   TRAP		x22		
                   LDI   	R0, KBDR 	; Print the character you enter.
                   TRAP  	x21		
		   JSR		NEWLINE
		   JSR		NEWLINE
 ;
		   LD		R0, StoreR0	;
                   RTI	
 ;
         NEWLINE   ST		R7, SaveR7	;
		   LD		R0, NEXTLINE	;
		   TRAP		x21		;
		   LD		R7, SaveR7	;
		   RET
 ;
         KBDR      .FILL	xFE02
	 StoreR0   .BLKW	1
	 SaveR7	   .BLKW	1
         INTINFO   .STRINGZ 	" My god!An interruption occurs! "
	 ECHO	   .STRINGZ	" The character you enter is: "
	 NEXTLINE  .FILL	x000A
                   .END                





