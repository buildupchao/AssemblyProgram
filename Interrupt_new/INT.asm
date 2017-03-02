 ; 
 ; This is an Interrupt Processing Program.
 ; User Program.
                        .ORIG	x3000
			LD	R6, STACKBASE	;
			AND	R1, R1, #0	;
			LD	R1, ENTRANCE	;
			STI	R1, INTV	;	
                        LD    	R1, MASK      	; Load Read bit into R1 
			STI   	R1, KBSR      	; (0100 0000 0000 0000 -> bit[14]: interrupt enable bit) 
 ;
 ;  User program is working.
               
            START       ST	R5, SaveR5	;
 ;
			LD	R5, NUM7	;
		        JSR	ROWODD		;
	    LOOPONE	JSR	WORK		; Call Subroutine
			LEA	R0, SPACE3	;
			TRAP	x22		;
			ADD	R5, R5, #-1	;
			BRp	LOOPONE		;
			LD	R0, NEWLINE	;
			TRAP	x21		; Print an newline
 ;			
			LD	R5, NUM6	;
			JSR	ROWEVE		;
	    LOOPTWO	LEA	R0, SPACE3	;
			TRAP	x22		;
			JSR	WORK		;
			ADD	R5, R5, #-1	;
			BRp	LOOPTWO		;
			LD	R0, NEWLINE	;
			TRAP	x21		;
			LD	R5, SaveR5	;
			BRnzp	START
 ;
 ; Subroutine ROWNUM
 ;
	    ROWODD	ST	R7, SaveR7	;
			LEA	R0, ODD		;
			TRAP	x22
			LD	R7, SaveR7
			RET
 ;
	    ROWEVE	ST	R7, SaveR7	;
			LEA	R0, EVE		;
			TRAP	x22		;
			LD	R7, SaveR7	;
			RET			;
 ;
 ; End the subroutine ROWODD AND ROWEVE
 ;
 ; The subroutine WORK
	    WORK	ST	R7, SaveR7	;
			LEA   	R0, PromptZ  	; Print the promptZ
                        TRAP  	x22          	; and  output to the monitor
 ;
			JSR	LOW		;
			LEA	R0, PromptY	; Print the promptY
			TRAP	x22		;
 ;
			JSR	LOW		;
            	     	LEA   	R0, PromptC  	; Print the PromptC
                        TRAP  	x22          	; and output to monitor				
 ;
			JSR	LOW		;
			LD	R7, SaveR7	;
                        RET			; Return to caller program
 ;  End the subroutine WORK
 ;
 ;  Low the speed
 ;
            LOW		ST	R7, StoreR7
			ST	R4, SaveR4
		        AND   	R4, R4, #0
            AGAIN       ADD   	R4, R4, #1
                        BRnp  	AGAIN 
			
			LD	R4, SaveR4
			LD	R7, StoreR7
			RET
 ;
 ; End the low
 ;
	    STACKBASE	.FILL	x3FFF
	    SaveR4	.BLKW	1
	    SaveR5	.BLKW	1
	    SaveR7	.BLKW	1
	    StoreR7	.BLKW	1
            KBSR        .FILL 	xFE00
            MASK        .FILL 	x4000
            INTV        .FILL 	x0180
	    ENTRANCE	.FILL	x1000
	    NUM7	.FILL	#7
	    NUM6	.FILL	#6
	    ODD		.STRINGZ "ODD:"
	    EVE		.STRINGZ "EVE:"
            PromptZ     .STRINGZ "Z"
	    PromptY	.STRINGZ "Y"
            PromptC     .STRINGZ "C"
	    SPACE3	.STRINGZ "   "
	    NEWLINE	.FILL	x000A
                        .END