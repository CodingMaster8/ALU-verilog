module SBCS(
	input [31:0] a, b,
	output [31:0] s,
	output c_out
);

wire [31:0] w_s;

ADD_ADCS_SUBS aas0(
.a(a),
.b(b),
.c_in(1),
.op(1),
.rev(0),
.s(w_s),
.c_out()
);

ADD_ADCS_SUBS aas1(
.a(w_s),
.b(1),
.c_in(1),
.op(1),
.rev(0),
.s(s),
.c_out(c_out)
);

endmodule 
