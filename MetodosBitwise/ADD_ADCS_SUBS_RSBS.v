module ADD_ADCS_SUBS_RSBS(
	input	[31:0] a, b,
	input c_in,
	input op,
	input rev,
	output [31:0] s,
	output c_out,
	output n, z, c, v
);

wire [30:0] w_c_out; // Senal del acarreo de salida de cada full adder
wire w_c_in; // Acarreo de entrada inicial
wire [31:0] w_b; // Senal del operando b
wire [31:0] w_a; // Senal del operando a

// Reajuste de las senales dependiendo del tipo de operacion
assign w_c_in = op ?  1 : c_in;
assign w_b = op ? (rev ? ~a : ~b) : b;
assign w_a = op ? (rev ? b : a): a;

genvar i;

// Instancia del primer full adder
fulladder fa0(.a(w_a[0]),.b(w_b[0]),.c_in(w_c_in),.s(s[0]),.c_out(w_c_out[0]));


// Ciclo para instanciar 30 full adders
// Cada acarreo de salida es el acarreo de saldia del siguiente full adder
generate 
  for (i = 1; i <= 30; i=i+1) begin : generador
      fulladder fa(.a(w_a[i]),.b(w_b[i]),.c_in(w_c_out[i-1]),.s(s[i]),.c_out(w_c_out[i]));
  end
endgenerate

//Instancia dl ultimo full adder
fulladder fa1(.a(w_a[31]),.b(w_b[31]),.c_in(w_c_out[30]),.s(s[31]),.c_out(c_out));

// Actualizacion de banderas
assign n = s[31];
assign z = ~(s[0] | s[1] | s[2] | s[3] | s[4] | s[5] | s[6] | s[7] | s[8] | s[9] | s[10] | s[11] | s[12] | s[13] | s[14] | s[15] | s[16] | s[17] | s[18] | s[19] | s[20] | s[21] | s[22] | s[23] | s[24] | s[25] | s[26] | s[27] | s[28] | s[29] | s[30] | s[31]);
assign c = c_out;
assign v = op ? ((a[31] & ~b[31] & ~s[31]) | (~a[31] & b[31] & s[31])) : ((~a[31] & ~b[31] & s[31]) | (a[31] & b[31] & ~s[31]));


endmodule 
