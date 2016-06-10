;Program Description: This program computes in eax the value of the expression x-2y+4z.
;					  Values of variables are input by the user.
;Programmer Name: Tara Eicher
;WSU ID: z847x563
;Professor: Nafia Malik
;Date Completed: 17 February 2013

.586
.MODEL FLAT

INCLUDE io.h										;Header file contains input/output macros.

.STACK 4096

.DATA
	promptX		BYTE	"Enter x-value:",0			;Messages will prompt user for values.
	promptY		BYTE	"Enter y-value:",0
	promptZ		BYTE	"Enter z-value:",0
	userInput	BYTE	40 DUP(?)					;Hold user input temporarily as ASCII.
	x			DWORD	?							;Hold converted user inputs.
	y			DWORD	?
	z			DWORD	?
	sum			BYTE	40 DUP(?)					;Store result as ASCII.
	lblOutput	BYTE	"x-2y+4z=",0				;Introduce the result in the output.

.CODE
	_MainProc PROC
				input	promptX,userInput,40		;Get user input x and store in memory as ASCII.
				atod	userInput					;Convert x to DWORD, store in eax.
				mov		x,eax						;Move x to memory.

				input	promptY,userInput,40		;Do likewise for y.
				atod	userInput					
				mov		y,eax						

				input	promptZ,userInput,40		;Do likewise for z.
				atod	userInput					
				mov		z,eax
				
				mov		eax,z						;Bring z in for manipulation.
				add		eax,eax						;eax=2z						
				add		eax,eax						;eax=4z

				mov		ebx,y						;Manipulate y independently from z.
				add		ebx,ebx						;ebx=2y
				neg		ebx							;ebx=-2y

				add		eax,ebx						;eax=4z-2y
				add		eax,x						;eax=4z-2y+x

				dtoa	sum,eax						;Move result to storage as ASCII.
				output	lblOutput,sum				;Output result.

				mov		eax,0						;exit with retcode 0.
				ret
	_MainProc ENDP
	END												