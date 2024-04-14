module EORS(
	input [31:0] a,
	input [31:0] b,
	output [31:0] o,
	output n, z
);

// Operacion XOR bit a bit
assign o = a ^ b;

// Actualizacion de la banderas
assign n = o[31];
assign z = ~(o[0] | o[1] | o[2] | o[3] | o[4] | o[5] | o[6] | o[7] | o[8] | o[9] | o[10] | o[11] | o[12] | o[13] | o[14] | o[15] | o[16] | o[17] | o[18] | o[19] | o[20] | o[21] | o[22] | o[23] | o[24] | o[25] | o[26] | o[27] | o[28] | o[29] | o[30] | o[31]);

endmodule 
