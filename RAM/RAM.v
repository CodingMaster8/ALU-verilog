module RAM #(parameter DATA_WIDTH = 32, parameter WORDS = 128) (
	input clk, reset,
	input wrenable, rdenable,
	input [DATA_WIDTH-1:0] data_in,
	input [$clog2(WORDS)-1:0] address,
	output [DATA_WIDTH-1:0] data_out
);

    wire [WORDS*DATA_WIDTH:0] 	Q;
    wire [WORDS-1:0] addresswire;
    wire [WORDS-1:0] writeenable;


    decoder8_256 decoder(address, addresswire);

    genvar i, j;

    generate
        for (i = 0; i < WORDS ; i = i + 1) begin: addressgenerate
            
            assign writeenable[i] = (addresswire[i] & wrenable);
            
            for (j = 0; j < DATA_WIDTH ; j = j + 1) begin: wordgenerate
                DFF d1(clk, reset, writeenable[i], data_in[j], Q[DATA_WIDTH*i + j]);
                
            end
        end
    endgenerate

    genvar k, x;

    generate
        for (k = 0; k < DATA_WIDTH; k = k + 1) begin: datagenerate
            wire [WORDS-1:0] temp;
            assign data_out[k] = |temp;
            
            for (x = 0; x < WORDS; x = x + 1) begin: addressgenerate
                assign temp[x] = Q[k+DATA_WIDTH*x] & addresswire[x] & rdenable;
            end
        end
    endgenerate

endmodule 