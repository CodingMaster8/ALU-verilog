`timescale 1ns / 1ps

module test_bench;

	// Definición de parámetros
	parameter CLK_PERIOD = 10; // Periodo de la señal de reloj en ns
	
	// Definición de señales
	// Inputs
	reg [4:0] PCNext;
   reg Reset, Clk, PCWrite;
	
	// Outputs
	wire [4:0] PCResult;
	wire [4:0] TempPCResult;
	
	
	// Instanciación del módulo
	ProgramCounter dut(
		.PCNext(PCNext),
      .Reset(Reset),
      .Clk(Clk),
      .PCWrite(PCWrite),
      .PCResult(PCResult),
		.TempPCResult(TempPCResult)
	);

	// Generación de la señal de reloj
   always
	begin
		#(CLK_PERIOD/2) Clk = ~Clk; // Invertir la señal de reloj cada medio periodo
   end

	// Inicialización de las señales
	initial
	begin
	// Initialize inputs
		Reset = 1;
      Clk = 0;
      PCWrite = 0;
      PCNext = 5'b00000;

      // Wait for a few clock cycles after Reset
      #10 Reset = 0;
		
		#10
		#10

		

      // Test scenario 2: Write a new PC value
      PCNext = 5'b00100;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		// Test scenario 3: Just wait
		#10
		#10
		
		// Test scenario 4: Write a new PC value
		PCNext = 5'b01100;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		// Test scenario 5: Keep waiting
		#10
		#10
		
		// Test scenario 1: Reset
      #10 Reset = 0;
      #10 Reset = 0;

      // Add more test scenarios as needed
      // Example: Write another PC value
      // PCNext = 32'h00000008;
      // PCWrite = 1;
      // #10 PCWrite = 0;
		
		#200
		#150
		
		// Test scenario 4: Write a new PC value
		PCNext = 5'b11110;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		#100

      // End simulation
      #10 $finish;
	end
		
endmodule
