module DFF(
    input	clk,
    input  	clr,
    input  	enable,
    input  	d,
    output 	q
);

	always @(posedge clk or posedge clr)
	begin
		if (clr)
			q <= 1'b0;
		else if (enable)
			q <= d;
	end

endmodule
