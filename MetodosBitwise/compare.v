module compare(
	
	reg[31:0] i_bit1,
	reg [31:0] i_bit2,
	
	wire [31:0] w_VECTOR
	
	o_bit;

)


	input i_bit1;
	input i_bit2;
	output o_bit;
	
	assign w_VECTOR = i_bit1 ~^ i_bit2;
	
	initial begin
		if (w_VECTOR == 32b'11111111111111111111111111111111) begin
			o_bit = 1b'1;
		
		end
		
		else
			o_bit = 1b'0;
	end
endmodule
		

