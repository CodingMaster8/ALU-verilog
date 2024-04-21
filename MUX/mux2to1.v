// Diseño basado en este diseño creado por vprabhu28:
// https://github.com/vprabhu28/16-Bit-CPU-using-Verilog/blob/master/CPU%2016-%20Bit%20using%20Verilog/Mux.v


///////////////////////////////////////////////////////
//// 		Design of Multiplxer		//////
/////////////////////////////////////////////////////

// Entran 2 números de 32 bits

module mux2to1(
	input clk,
	input [31:0] a,
	input [31:0] b,
	input sel,
	
	// El select puede tener también origen a modo de Forward
	// Forward_C y Forward_D son únicamente de 1 bit
	// Mientras que Forward_A y Forward B son de 2 bits
	// y se usan para el multiplexor de 3 a 1

	output reg [31:0] out
);

always@(posedge clk)
begin
	if ( sel == 1 ) begin
	out <= a;
	end
	else if ( sel == 0) begin
	out <= b;
	end
end
endmodule 