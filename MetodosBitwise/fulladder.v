module fulladder(
	input 	a,			// Operando 1
		b,			// Operando 2
		c_in,			// Acarreo de entrada
	output	s,			// Resultado
		c_out			// Acarreo de salida
);


assign s = a ^ b ^ c_in;			// Calculo de la suma de 2 bits
assign c_out = (a & b) | ((a ^ b) & c_in);	// Calculo acarreo de 2 bits

endmodule 
