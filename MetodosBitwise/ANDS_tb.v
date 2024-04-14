module ANDS_tb();

reg [31:0] a;
reg [31:0] b;
wire [31:0] o;
wire n, z;

// Instancia para la cama de pruebas 	
ANDS DUT(
.a(a),
.b(b),
.o(o)
);

// Estimulos
initial
begin
	a = 39718;
	b = 0;
	#10
	a = 49843;
	b = 189804;
	#10
	a = 187324;
	b = 678909;
	#10
	$stop;
end

endmodule 
