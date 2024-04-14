module ADD_ADCS_SUBS_tb();

reg	[31:0] a, b;
reg	c_in;
reg	op;
wire	[31:0] s;
wire	c_out;

ADD_ADCS_SUBS DUT(
.a(a),
.b(b),
.c_in(c_in),
.op(op),
.s(s),
.c_out(c_out)
);

initial
begin
	a = 82347156;
	b = 9483;
	c_in = 0;
	op = 0;
	#10
	c_in = 1;
	op = 0;
	#10
	op = 1;
	#10
	c_in = 0;
	#10
	a = 9483;
	b = 82347156;
	c_in = 0;
	op = 0;
	#10
	c_in = 1;
	op = 0;
	#10
	op = 1;
	#10
	c_in = 0;
	#10
	$stop;
end

endmodule 
