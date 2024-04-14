`timescale 1ns / 1ps

module array_tb;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [63:0] c;

    // Instantiate the module to be tested
    array32 dut (
        .a(a),
        .b(b),
        .c(c)
    );

    // Generate clock signal
    reg clk = 0;
    always #5 clk = ~clk;

    // Test stimuli
    initial begin
        // Initialize inputs
        a = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
        b = 32'b11111111111111111111111111111111;

        // Apply inputs and observe outputs for 10 clock cycles
        repeat (10) begin
            #10 a = a + 1; // Increment a
            #10 b = b - 1; // Decrement b
            // Display outputs in decimal format
				#100
            $display("a = %d, b = %d, c = %d", a, b, c);
        end

        // End simulation
        $finish;
    end

    // Clock driver
    always begin
        #5 clk = ~clk;
    end

endmodule