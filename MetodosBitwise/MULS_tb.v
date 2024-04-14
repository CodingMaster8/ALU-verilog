module MULS_tb();

reg [31:0] a, b;
wire [31:0] m;
wire n, z;

MULS DUT(
.a(a),
.b(b),
.m(m),
.n(n),
.z(z)
);

initial
begin
	a = 15;
	b = 5;
	#10
	a = 435;
	b = 29;
	#10
	$stop;
end

endmodule 
