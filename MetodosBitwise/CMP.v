module CMP(
	input [31:0] a, b,
	output wire n,
	output wire z,
	output wire c,
	output wire v
);
	

wire [31:0] s;
wire c_out;

ADD_ADCS_SUBS_RSBS DUT(
.a(a),
.b(b),
.c_in(1),
.op(1),
.rev(0),
.s(s),
.c_out(c_out)
);

assign c = c_out;
assign n = s[31];
assign z = ~(s[0] | s[1] | s[2] | s[3] | s[4] | s[5] | s[6] | s[7] | s[8] | s[9] | s[10] | s[11] | s[12] | s[13] | s[14] | s[15] | s[16] | s[17] | s[18] | s[19] | s[20] | s[21] | s[22] | s[23] | s[24] | s[25] | s[26] | s[27] | s[28] | s[29] | s[30] | s[31]);
assign v = (a[31] & ~b[31] & ~s[31]) | (~a[31] & b[31] & s[31]);
	
	
endmodule 
