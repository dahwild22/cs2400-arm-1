		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		adr		r0, numbers 	  ;adr num -> r0
		adr		r7, result  	  ;adr result -> r7
		adr		r8, carry   	  ;adr carry -> r8
		
		ldr		r1, [r0]	  ;first num -> r1
		ldr		r2, [r0,#4] 	  ;second num -> r2
		mov		r5, #16     	  ;loop ctr for 16 bits
		mov		r3, #1	  	  ;setting mask to 1
		mov		r6, #0	          ;accumulator
loop						  ; -- loop for each bit
		and		r4,r3,r2	  ;logical operator AND to check bits
		subs		r4,r4,#1	  ;checks if the result is 0 or negative
		addpl	        r6,r6,r1	  ;if 0 add first num -> accumulator
		lsr		r2,r2,#1	  ;shift number being checked right for the next digit
		lsl		r1,r1,#1	  ;shift number put into acc left
		subs		r5,r5,#1	  ;decrement loop ctr
		bne		loop		  ;branch to loop
		str		r6, [r7]	  ;store outcome from acc -> result in mem
		end
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4
