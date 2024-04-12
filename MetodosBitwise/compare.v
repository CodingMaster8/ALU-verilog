module compare(
	
	input [31:0] i_bit1,
	input [31:0] i_bit2,

	
	input c_in,
	
	output [1:0] n,
	output [1:0] z,
	output [1:0] c,
	output [1:0] v,
	
	reg carry,

)
	
	assign n = 0;
	assign z = 0;
	assign c = 0;
	assign v = 0;
	
	wire [31:0] w_VECTOR;
	wire [31:0] xor_outputs;
	
	
	
	SUBS s1(.i_bit1(i_bit1), .i_bit2(i_bit2), .c_in(c_in), .s[w_VECTOR], .c_out(carry));
	
	
	assign xor_outputs[0] = w_VECTOR[0] ^ 1'b0;
	assign xor_outputs[1] = w_VECTOR[1] ^ 1'b0;
	assign xor_outputs[2] = w_VECTOR[2] ^ 1'b0;
	assign xor_outputs[3] = w_VECTOR[3] ^ 1'b0;
	assign xor_outputs[4] = w_VECTOR[4] ^ 1'b0;
	assign xor_outputs[5] = w_VECTOR[5] ^ 1'b0;
	assign xor_outputs[6] = w_VECTOR[6] ^ 1'b0;
	assign xor_outputs[7] = w_VECTOR[7] ^ 1'b0;
	assign xor_outputs[8] = w_VECTOR[8] ^ 1'b0;
	assign xor_outputs[9] = w_VECTOR[9] ^ 1'b0;
	assign xor_outputs[10] = w_VECTOR[10] ^ 1'b0;
	assign xor_outputs[11] = w_VECTOR[11] ^ 1'b0;
	assign xor_outputs[12] = w_VECTOR[12] ^ 1'b0;
	assign xor_outputs[13] = w_VECTOR[13] ^ 1'b0;
	assign xor_outputs[14] = w_VECTOR[14] ^ 1'b0;
	assign xor_outputs[15] = w_VECTOR[15] ^ 1'b0;
	assign xor_outputs[16] = w_VECTOR[16] ^ 1'b0;
	assign xor_outputs[17] = w_VECTOR[17] ^ 1'b0;
	assign xor_outputs[18] = w_VECTOR[18] ^ 1'b0;
	assign xor_outputs[19] = w_VECTOR[19] ^ 1'b0;
	assign xor_outputs[20] = w_VECTOR[20] ^ 1'b0;
	assign xor_outputs[21] = w_VECTOR[21] ^ 1'b0;
	assign xor_outputs[22] = w_VECTOR[22] ^ 1'b0;
	assign xor_outputs[23] = w_VECTOR[23] ^ 1'b0;
	assign xor_outputs[24] = w_VECTOR[24] ^ 1'b0;
	assign xor_outputs[25] = w_VECTOR[25] ^ 1'b0;
	assign xor_outputs[26] = w_VECTOR[26] ^ 1'b0;
	assign xor_outputs[27] = w_VECTOR[27] ^ 1'b0;
	assign xor_outputs[28] = w_VECTOR[28] ^ 1'b0;
	assign xor_outputs[29] = w_VECTOR[29] ^ 1'b0;
	assign xor_outputs[30] = w_VECTOR[30] ^ 1'b0;
	assign xor_outputs[31] = w_VECTOR[31] ^ 1'b0;
	
	assign z = ~(xor_outputs[0] | xor_outputs[1] | xor_outputs[2] | xor_outputs[3] | xor_outputs[4] | xor_outputs[5] | xor_outputs[6] | xor_outputs[7] | xor_outputs[8] | xor_outputs[9] | xor_outputs[10] | xor_outputs[11] | xor_outputs[12] | xor_outputs[13] | xor_outputs[14] | xor_outputs[15] | or_outputs[16] | xor_outputs[17] | xor_outputs[18] | xor_outputs[19] | xor_outputs[20] | xor_outputs[21] | xor_outputs[22] | xor_outputs[23] | xor_outputs[24] | xor_outputs[25] | xor_outputs[26] | xor_outputs[27] | xor_outputs[28] | xor_outputs[29] | xor_outputs[30] | xor_outputs[31]);
	
	assign v = w_VECTOR[31] ^ carry;
	
	
	if (carry) begin
		assign c = 1;
	end
	
	if (w_VECTOR[31])
		assign n = 1;
	end
	
endmodule
	
	
	
		
		
		
endmodule
		

