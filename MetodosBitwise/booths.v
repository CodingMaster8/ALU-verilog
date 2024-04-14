module booths(
	input [31:0] i_A, i_Q,
	input i_q1,
	output [31:0] i_m,
	output [31:0] o_A, o_Q,
	output o_q1
);

// Registros para almacenar los valores
reg [31:0] aux_A, aux_Q;
reg aux_q1;
wire [31:0] addAM, subAM;

// Suma y resta de la mitad izquierda del prodcuto con el multiplicador
ADD_ADCS_SUBS_RSBS adding(.a(i_A), .b(i_m), .c_in(0), .op(0), .rev(0), .s(addAM), .c_out());
ADD_ADCS_SUBS_RSBS subtracting(.a(i_A), .b(i_m), .c_in(1), .op(1), .rev(0), .s(subAM), .c_out());


always@(*)
begin
	// Si el lsb es igual a q-1 solamente se hace shift a la derecha
	if(i_Q[0] == i_q1) begin
		aux_q1 = i_Q[0];
		aux_Q[31] = i_A[0];
		aux_Q[30:0] = i_Q[31:1];
		aux_A[31] = i_A[31];
		aux_A[30:0] = i_A[31:1];
	// Si el lsb es 1 y q-1 es 0 se resta el multiplicador y shift a la derecha
	end else if(i_Q[0] & ~i_q1) begin
		aux_q1 = i_Q[0];
		aux_Q[31] = subAM[0];
		aux_Q[30:0] = i_Q[31:1];
		aux_A[31] = subAM[31];
		aux_A[30:0] = subAM[31:1];
	end
	else begin
	// Si el lsb es 0 y q-1 es 1 se suma el multiplicador y shift a la derecha
		aux_q1 = i_Q[0];
		aux_Q[31] = addAM[0];
		aux_Q[30:0] = i_Q[31:1];
		aux_A[31] = addAM[31];
		aux_A[30:0] = addAM[31:1];
	end
end

// Asignacion de los restultados
assign o_A = aux_A;
assign o_Q = aux_Q;
assign o_q1 = aux_q1;

endmodule 
