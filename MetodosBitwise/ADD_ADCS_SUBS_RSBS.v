module ADD_ADCS_SUBS_RSBS(
	input	[31:0] a, b,
	input	c_in,
	input op,
	input rev,
	output [31:0] s,
	output c_out
);

wire [30:0] w_c_out;
wire w_c_in;
wire [31:0] w_b;
wire [31:0] w_a;

assign w_c_in = op ?  1 : c_in;
assign w_b = op ? (rev ? ~a : ~b) : b;
assign w_a = op ? (rev ? b : a): a;

genvar i;

fulladder fa0(.a(w_a[0]),.b(w_b[0]),.c_in(w_c_in),.s(s[0]),.c_out(w_c_out[0]));

generate 
  for (i = 1; i <= 30; i=i+1) begin : generador
      fulladder fa(.a(w_a[i]),.b(w_b[i]),.c_in(w_c_out[i-1]),.s(s[i]),.c_out(w_c_out[i]));
  end
endgenerate

fulladder fa1(.a(w_a[31]),.b(w_b[31]),.c_in(w_c_out[30]),.s(s[31]),.c_out(c_out));

endmodule 
