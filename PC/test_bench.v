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

	initial
	begin
	// Inicialización de las señales
		Reset = 1;
      Clk = 0;
      PCWrite = 0;
      PCNext = 5'b00000;

      // Esperar algunos ciclos tras el Reset
      #10 Reset = 0;
		#10
		#10

      // Escenario 1: Escribir un nuevo valor a PC
      PCNext = 5'b00100;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		// Escenario 2: Esperar
		#10
		#10
		
		// Escenario 3: Escribir un nuevo valor a PC
		PCNext = 5'b01100;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		// Escenario 4: Seguir esperando
		#10
		#10
		
		// Escenario 5: Aplicar un Reset
      #10 Reset = 0;
      #10 Reset = 0;
		
		// Escenario 6: Esperar hasta que PC se llene
		#200
		#150
		
		// Escenario 7: Escribir un nuevo valor a PC
		PCNext = 5'b11110;
      PCWrite = 1;
      #10 PCWrite = 0;
		
		// Escenario 8: Seguir esperando
		#100

      // Terminar la simulación
      #10 $finish;
	end
		
endmodule
