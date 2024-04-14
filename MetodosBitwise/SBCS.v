odule SBCS(
	input [31:0] a, b,
	output [31:0] s,
	output c_out,
	output n, z, c, v
);

// Senal de salida de la primera instancia
wire [31:0] w_s;

// Instancia para resta de operando1 - operando2
ADD_ADCS_SUBS_RSBS aas0(
.a(a),
.b(b),
.c_in(1),
.op(1),
.rev(0),
.s(w_s),
.c_out(),
.n(),
.z(),
.c(),
.v()
);

// Instancia de resta de resultado - 1
ADD_ADCS_SUBS_RSBS aas1(
.a(w_s),
.b(1),
.c_in(1),
.op(1),
.rev(0),
.s(s),
.c_out(c_out),
.n(n),
.z(z),
.c(c),
.v(v)
);

endmodule 
