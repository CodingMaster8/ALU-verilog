module SBCS_tb();

reg [31:0] a, b;
wire [31:0] s;
wire c_out;
wire n, z, c, v;

// Instancia de la cama de pruebas
SBCS s0(
.a(a),
.b(b),
.s(s),
.c_out(c_out),
.n(n),
.z(z),
.c(c),
.v(v)
);

// Estimulo
initial
begin
	a = 13409;
	b = 713;
	#10
	a = 4576;
	b = 259;
	#10
	$stop;
end

endmodule 
