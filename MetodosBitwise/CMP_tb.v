module CMP_tb();

reg [31:0] a, b;
wire n;
wire z;
wire c;
wire v;

CMP DUT(
.a(a),
.b(b),
.n(n),
.z(z),
.c(c),
.v(v)
);

initial
begin
	a = 32'h8_0_0_0_0_0_0_0;
	b = 32'h7_F_F_F_F_F_F_F;
	#10
	a = 98428751;
	b = -981429;
	#10
	a = 52529;
	b = 42;
	#10
	a = -9872;
	b = 38;
	#10
	$stop;
end

endmodule 
