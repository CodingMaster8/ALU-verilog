module logical_or(
	i_bit1,
	i_bit2,
	
	o_bit
	
)


	input i_bit1;
	input i_bit2;
	
	output o_bit;
	
	assign o_bit = i_bit1 | i_bit2;
	
endmodule

