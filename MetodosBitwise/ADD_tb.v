module ADD_tb();

reg [31:0] a, b;
reg c_in;
wire [31:0] s;
wire c_out;

ADD DUT(
.a(a),
.b(b),
.c_in(c_in),
.s(s),
.c_out(c_out)
);

initial
begin
	a = 32'd53;
	b = 32'd17;
	c_in = 0;
	#10
	c_in = 1;
	#10
	$stop;
end

endmodule 
