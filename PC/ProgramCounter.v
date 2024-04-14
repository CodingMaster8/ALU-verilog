//-------------------------------------------------------------------------------------//
// Este programa se encuentra basado en el siguiente programa:
// https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ProgramCounter.v
// Creado por Eric Cascketta
//
// El programa consiste en un contador que comienza en 0 y aumenta de uno en uno
// para indicar una dirección de memoria hasta alcanzar un máximo de 31. Este
// funcionamiento normal se puede ver interrumpido por PCWrite, que es una entrada
// binaria que decide si el PC se establecerá en una dirección deseada externa
// (PCNext) para que, una vez indicada, el PC volverá a los valores que estaba contando.
//
// El programa se reinicia de 2 maneras:
// - Al activar el Reset
// - Al alcanzar el contador máximo
//
//-------------------------------------------------------------------------------------//

module ProgramCounter(

	input       [4:0]  PCNext, // Entrada que indica el próximo valor del PC
	input              Reset, 	// Entrada de reinicio que setea el PC a 0
							 Clk, // Entrada de reloj
							 PCWrite, // Entrada que controla si se debe escribir en el PC

	output reg  [4:0]  PCResult, // Salida que indica el valor del PC
	output reg	[4:0]  TempPCResult // Almacena el valor del PC para volver al contador normal
);

	// Al iniciar, tanto PCResult como TempPCResult se inicializan en 0
	initial begin
		PCResult <= 5'b00000;
		TempPCResult <= 5'b00000;
	end
	 
	// Se utiliza el flanco positivo del clk para actualizar el PC
	always @(posedge Clk) begin
	// Al activarse el reset, el programa setea tanto el PCResult como en TempPCResult a 0
   if (Reset == 1) begin
		PCResult <= 5'b00000;
      TempPCResult <= 5'b00000;
   end
	else
	begin
		// Mientras esté deshabilitado el PCWrite el PC solo será un contador
      if (PCWrite == 0)
		begin
			// Una vez alcanzado el PCResult máximo, ambos contadores se reinician
			if (PCResult == 5'b11111)
			begin
				PCResult <= 5'b00000;
            TempPCResult <= 5'b00000;
         end
			else
			begin
				// TempPCResult sirve para restaurar el valor del PC al volver de una escritura
            PCResult = TempPCResult; // Restaurar el valor de PCResult
            TempPCResult = PCResult + 1; // Guardar el nuevo valor de PCResult en TempPCResult
													  // a la vez que aumenta el contador
         end
      end
		else
		begin
			// PCResult toma el valor de PCNext al habilitarse PCWrite
			PCResult = PCNext;
      end
   end
end

endmodule
