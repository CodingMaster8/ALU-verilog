module ADD_ADCS_SUBS_RSBS_tb();

reg	[31:0] a, b;
reg	c_in;
reg	op;
reg	rev;
wire	[31:0] s;
wire	c_out;

ADD_ADCS_SUBS_RSBS DUT(
.a(a),
.b(b),
.c_in(c_in),
.op(op),
.rev(rev),
.s(s),
.c_out(c_out)
);

initial
begin
	a = 82347156;
	b = 9483;
	op = 0;
	c_in = 0;
	rev = 0;
	#10
	op = 0;
	c_in = 0;
	rev = 1;
	#10
	op = 0;
	c_in = 1;
	rev = 0;
	#10
	op = 0;
	c_in = 1;
	rev = 1;
	#10
	op = 1;
	c_in = 0;
	rev = 0;
	#10
	op = 1;
	c_in = 0;
	rev = 1;
	#10
	op = 1;
	c_in = 1;
	rev = 0;
	#10
	op = 1;
	c_in = 1;
	rev = 1;
	#10
	$stop;
end

endmodule 
