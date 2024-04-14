module CMP(
	input [31:0] a, b,
	output wire n,
	output wire z,
	output wire c,
	output wire v
);
	
// Senales de salida de la instancia
wire [31:0] s;
wire c_out;

// Instancia del modulo de resta con actualizacion de banderas
ADD_ADCS_SUBS_RSBS DUT(
.a(a),
.b(b),
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
