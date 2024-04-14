module MULS(
	input [31:0] a, b,
	output [31:0] m,
	output n, z
);

// Variables necesarias para implementar el algoritmo de booth
wire [31:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15,
				A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31;
wire [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
				Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
wire [31:0] q;
wire [63:0] final_m;

// Instanciacion de las 32 iteraciones del algoritmo de booth
booths bth0(.i_A(32'h00000000), .i_Q(a), .i_q1(1'b0), .i_m(b), .o_A(A0), .o_Q(Q0), .o_q1(q[0]));
booths bth1(.i_A(A0), .i_Q(Q0), .i_q1(q[0]), .i_m(b), .o_A(A1), .o_Q(Q1), .o_q1(q[1]));
booths bth2(.i_A(A1), .i_Q(Q1), .i_q1(q[1]), .i_m(b), .o_A(A2), .o_Q(Q2), .o_q1(q[2]));
booths bth3(.i_A(A2), .i_Q(Q2), .i_q1(q[2]), .i_m(b), .o_A(A3), .o_Q(Q3), .o_q1(q[3]));
booths bth4(.i_A(A3), .i_Q(Q3), .i_q1(q[3]), .i_m(b), .o_A(A4), .o_Q(Q4), .o_q1(q[4]));
booths bth5(.i_A(A4), .i_Q(Q4), .i_q1(q[4]), .i_m(b), .o_A(A5), .o_Q(Q5), .o_q1(q[5]));
booths bth6(.i_A(A5), .i_Q(Q5), .i_q1(q[5]), .i_m(b), .o_A(A6), .o_Q(Q6), .o_q1(q[6]));
booths bth7(.i_A(A6), .i_Q(Q6), .i_q1(q[6]), .i_m(b), .o_A(A7), .o_Q(Q7), .o_q1(q[7]));

booths bth8(.i_A(A7), .i_Q(Q7), .i_q1(q[7]), .i_m(b), .o_A(A8), .o_Q(Q8), .o_q1(q[8]));
booths bth9(.i_A(A8), .i_Q(Q8), .i_q1(q[8]), .i_m(b), .o_A(A9), .o_Q(Q9), .o_q1(q[9]));
booths bth10(.i_A(A9), .i_Q(Q9), .i_q1(q[9]), .i_m(b), .o_A(A10), .o_Q(Q10), .o_q1(q[10]));
booths bth11(.i_A(A10), .i_Q(Q10), .i_q1(q[10]), .i_m(b), .o_A(A11), .o_Q(Q11), .o_q1(q[11]));
booths bth12(.i_A(A11), .i_Q(Q11), .i_q1(q[11]), .i_m(b), .o_A(A12), .o_Q(Q12), .o_q1(q[12]));
booths bth13(.i_A(A12), .i_Q(Q12), .i_q1(q[12]), .i_m(b), .o_A(A13), .o_Q(Q13), .o_q1(q[13]));
booths bth14(.i_A(A13), .i_Q(Q13), .i_q1(q[13]), .i_m(b), .o_A(A14), .o_Q(Q14), .o_q1(q[14]));
booths bth15(.i_A(A14), .i_Q(Q14), .i_q1(q[14]), .i_m(b), .o_A(A15), .o_Q(Q15), .o_q1(q[15]));

booths bth16(.i_A(A15), .i_Q(Q15), .i_q1(q[15]), .i_m(b), .o_A(A16), .o_Q(Q16), .o_q1(q[16]));
booths bth17(.i_A(A16), .i_Q(Q16), .i_q1(q[16]), .i_m(b), .o_A(A17), .o_Q(Q17), .o_q1(q[17]));
booths bth18(.i_A(A17), .i_Q(Q17), .i_q1(q[17]), .i_m(b), .o_A(A18), .o_Q(Q18), .o_q1(q[18]));
booths bth19(.i_A(A18), .i_Q(Q18), .i_q1(q[18]), .i_m(b), .o_A(A19), .o_Q(Q19), .o_q1(q[19]));
booths bth20(.i_A(A19), .i_Q(Q19), .i_q1(q[19]), .i_m(b), .o_A(A20), .o_Q(Q20), .o_q1(q[20]));
booths bth21(.i_A(A20), .i_Q(Q20), .i_q1(q[20]), .i_m(b), .o_A(A21), .o_Q(Q21), .o_q1(q[21]));
booths bth22(.i_A(A21), .i_Q(Q21), .i_q1(q[21]), .i_m(b), .o_A(A22), .o_Q(Q22), .o_q1(q[22]));
booths bth23(.i_A(A22), .i_Q(Q22), .i_q1(q[22]), .i_m(b), .o_A(A23), .o_Q(Q23), .o_q1(q[23]));

booths bth24(.i_A(A23), .i_Q(Q23), .i_q1(q[23]), .i_m(b), .o_A(A24), .o_Q(Q24), .o_q1(q[24]));
booths bth25(.i_A(A24), .i_Q(Q24), .i_q1(q[24]), .i_m(b), .o_A(A25), .o_Q(Q25), .o_q1(q[25]));
booths bth26(.i_A(A25), .i_Q(Q25), .i_q1(q[25]), .i_m(b), .o_A(A26), .o_Q(Q26), .o_q1(q[26]));
booths bth27(.i_A(A26), .i_Q(Q26), .i_q1(q[26]), .i_m(b), .o_A(A27), .o_Q(Q27), .o_q1(q[27]));
booths bth28(.i_A(A27), .i_Q(Q27), .i_q1(q[27]), .i_m(b), .o_A(A28), .o_Q(Q28), .o_q1(q[28]));
booths bth29(.i_A(A28), .i_Q(Q28), .i_q1(q[28]), .i_m(b), .o_A(A29), .o_Q(Q29), .o_q1(q[29]));
booths bth30(.i_A(A29), .i_Q(Q29), .i_q1(q[29]), .i_m(b), .o_A(A30), .o_Q(Q30), .o_q1(q[30]));
booths bth31(.i_A(A30), .i_Q(Q30), .i_q1(q[30]), .i_m(b), .o_A(A31), .o_Q(Q31), .o_q1(q[31]));

// Resultados asignados
assign final_m[31:0] = Q31;
assign final_m[63:32] = A31;
assign m = Q31;

// Actualizacion de banderas
assign n = m[31];
assign z = ~(m[0] | m[1] | m[2] | m[3] | m[4] | m[5] | m[6] | m[7] | m[8] | m[9] | m[10] | m[11] | m[12] | m[13] | m[14] | m[15] | m[16] | m[17] | m[18] | m[19] | m[20] | m[21] | m[22] | m[23] | m[24] | m[25] | m[26] | m[27] | m[28] | m[29] | m[30] | m[31]);

endmodule 
