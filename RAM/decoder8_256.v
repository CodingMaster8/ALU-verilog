module decoder5_32(
	input [4:0] data_in,
	output reg [31:0] data_out
);
	
	always @(*)
	begin
		 data_out = 32'b0;
		 data_out[data_in] = 1;
	end

endmodule
