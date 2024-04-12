module fulladder(
	input 	a,
				b,
				c_in,
	output	s,
				c_out
);

assign s = a ^ b ^ c_in;
assign c_out = (a & b) + ((a ^ b) & c_in);

endmodule 
