module ANDS(
	input [31:0] i_bit1,
	input [31:0] i_bit2,
	
	output [31:0] o_bit
	
)

	
	assign o_bit = i_bit1 & i_bit2;
	
endmodule

