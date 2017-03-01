 ; The program is about bubble sort.
 ; This is main function. 
 ; In this program, R0 is a label register,
 ;
					.ORIG	x3000
					AND	R3, R3, #0		;
					LD	R3, DATAPTR		; Load the data address into R3.
			OutLoop		LDR	R1, R3, #0		; Initialize.
					ADD	R4, R3, #1		;
			InLoop		LDR	R2, R4, #0		;
 ;
 ; Check if the end is coming.
					AND	R5, R5, #0		;
					ADD	R5, R2, #-4		;
					BRz	OUTPUT			;
 ;
 ; Call subroutine.
 ;
					JSR	SWAP			;
 ;
 ; Increment and check the sentinel.
 ;
					ADD	R4, R4, #1		;
					AND	R5, R5, #0		;
					LDR	R5, R4, #0		;
					ADD	R5, R5, #-4		;
					BRnp	InLoop			;
					AND	R4, R4, #0		;
					ADD	R3, R3, #1		;
					AND	R5, R5, #0		;
					LDR	R5, R3, #0		;
					ADD	R5, R5, #-4		;
					BRz	OUTPUT			;
					BRnzp	OutLoop			;
 ;
 ; Subroutine.
 ;
			SWAP		ST	R7, SaveR7		; Store the contents of R7, R1, R2 and R3.
					ST	R3, SaveR3		;
 ;
					AND	R3, R3, #0		; Clear.
 ;
 ; if (R2 - R1 >= 0) is true,
 ; then back to main function.
 ; else swap.
 ;
					NOT 	R3, R1			; Calculate the result of R1 plus R2. 
					ADD	R3, R3, #1		;
					ADD	R3, R3, R2		;
					BRzp	GOBACK			; Compare.
 ;
 ; exchange the value when (R1 - R2 < 0) is true.
 ;
					AND 	R3, R3, #0		;
					ADD	R3, R1, #0		;
					ADD	R1, R2, #0		;
					ADD	R2, R3, #0		;
 ;
 ; Store the values of R1 and R2 into memory.
 ;
					LD	R3, SaveR3		;
					STR	R1, R3, #0		; Store the contents of R1 and R2 into memory.
					STR	R2, R4, #0		;
			GOBACK		LD	R3, SaveR3		; Restore the contents of R3 and R7.		
					LD	R7, SaveR7		; 
		 			RET				;

 ;
 ; Output to console.
 ;
 			OUTPUT		LEA	R0, PROMPT1		;
					TRAP	x22 			;
					LD	R0, NEWLINE		;
					TRAP	x21			;
					LEA	R0, PROMPT2		;
					TRAP	x22			;
					LD	R0, NEWLINE		;
					TRAP	x21			;
					LEA	R0, PROMPT3		;
					TRAP	x22			;
					LD	R0, NEWLINE		;
					TRAP	x21			;
 ;
					AND	R3, R3, #0		;
					AND	R5, R5, #0		;
					LD	R3, DATAPTR		;
			LOOP		LDR	R0, R3, #0		; Load the data into R0
					JSR	BinarytoASCII		;
					AND	R4, R4, #0		;
					ADD	R4, R4, #4		;
					LEA	R2, ASCIIBUFF		;
			AGAIN		LDR	R0, R2, #0		;
					TRAP	x21			;
					ADD	R2, R2, #1		;
					ADD	R4, R4, #-1		;
					BRp	AGAIN			;
					LD	R0, NEWLINE		;
					TRAP	x21			;
					ADD	R3, R3, #1		;
					LDR	R5, R3, #0		;
					ADD	R5, R5, #-4		;
					BRz	EXIT			;
					BRnzp	LOOP			;								
 ;
 ; This program is to convert binary to ASCII.
 ; This algorithm takes the 2's complement representation of a signed
 ; integer within the range -999 to +999 and converts it into an ASCII
 ; string consisting of a sign digit, followed by three decimal digits.
 ; R0 contains the initial value being converted. 
 ;
			BinarytoASCII	ST	R7, SaveR7	; Save the contents of R7, R0, R1, R2, R3
					ST	R0, SaveR0	;
					ST	R1, SaveR1	; 
					ST	R2, SaveR2	;
					ST 	R3, SaveR3	;
 ;
					LEA	R1, ASCIIBUFF	; R1 points to string being generated.
					ADD	R0, R0, #0	; R0 contains the binary value.
					BRn	NEGSIGN		;
					LD	R2, ASCIIPLUS	; First store the ASCII plus sign.
					STR	R2, R1, #0	;
					BRnzp	BEGIN100	;
			NEGSIGN		LD	R2, ASCIIMINUS	; First store ASCII minus sign.
					STR	R2, R1, #0	;
					NOT 	R0, R0		; Convert the number to absolute
					ADD	R0, R0, #1	; value; it is easier to work with.
 ;
			BEGIN100	LD	R2, ASCIIOFFSET	; Prepare for "hundreds" digit.
 ;
					LD	R3, NEG100	; Determine the hundreds digit.
			LOOP100		ADD	R0, R0, R3	;
					BRn	END100		;
					ADD	R2, R2, #1	;
					BRnzp	LOOP100		;
 ;
			END100		STR	R2, R1, #1	; Store ASCII code for hundreds digit.
					LD	R3, POS100	;
					ADD	R0, R0, R3	; Correct R0 for one-too-many subtracts.
 ;
			BEGIN10		LD	R2, ASCIIOFFSET ; Prepare for "tens" digit.
 ;
  	  				LD	R3, NEG10	; Determine the tens digit.
			LOOP10		ADD	R0, R0, R3	;
					BRn	END10		;
					ADD	R2, R2, #1	;
					BRnzp	LOOP10		;
 ;
 			END10		STR	R2, R1, #2	; Store ASCII code for tens digit.
					ADD	R0, R0, #10	; Correct R0 for one-too-many subtracts.
 ;
			BEGIN1		LD	R2, ASCIIOFFSET	; Prepare for "ones" digit.
					ADD	R2, R2, R0	;
					STR	R2, R1, #3	;
 ;		
					LD	R0, SaveR0	; Restore the content of R0, R1, R2, R3
					LD	R1, SaveR1	;
					LD	R2, SaveR2	;
					LD	R3, SaveR3	;
					LD	R7, SaveR7	;
 ;				
					RET			;
 ;
			EXIT		TRAP	x25		;
 ;
			DATAPTR		.FILL	x3100		;
			SaveR7		.BLKW	1		;
			SaveR0		.BLKW	1		;
			SaveR1		.BLKW	1		;
			SaveR2		.BLKW	1		;
			SaveR3		.BLKW	1		;
			SaveR4		.BLKW	1		;
			SaveR5		.BLKW	1		;	
			NegASCIIOffset	.FILL	xFFD0		; -x0030
			ASCIIBUFF	.BLKW	4		;
			ASCIIPLUS	.FILL	x002B		; Plus
			ASCIIMINUS	.FILL	x002D		; Minus
			ASCIIOFFSET	.FILL	x0030		; 
			NEG100		.FILL	xFF9C		; -100
			POS100		.FILL	x0064		; +100
			NEG10		.FILL	xFFF6		; -10							
			NEWLINE		.FILL	x000A		; 
			PROMPT1		.STRINGZ "The number sequence is :";
			PROMPT2		.STRINGZ "99, -7, 12, 45, 87, -111, 67, 3, 0, 18";
			PROMPT3		.STRINGZ "The result is :";
					.END