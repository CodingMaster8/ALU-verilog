// Diseño basado en este diseño recuperado de Javatpoint:
// https://www.javatpoint.com/verilog-multiplexer

// El código es fácilmente escalable para usar más entradas
module mux3to1(
	input clk,
	input [31:0] a,			 // 32-bit input called a  
	input [31:0] b,          // 32-bit input called b  
	input [31:0] c,          // 32-bit input called c  
	input [1:0] sel,         // input sel used to select between a,b,c,d
	
	// Al igual que en el MUX2to1, aquí el sel también puede tener origen
	// en un Forward, pero en este caso de 2 bits
	
	output reg [31:0] out	 // 32-bit output based on input sel 
);          

	// This always block gets executed whenever a/b/c/d/sel changes value  
   // When it happens, output is assigned to either a/b/c/d  
   always @ (posedge clk)
	begin  
      case (sel)  
         2'b00 : out <= a;  
         2'b01 : out <= b;  
         2'b10 : out <= c;  
         2'b11 : out <= c;
			// Al seleccionar un cuarto dato se selecciona el tercer dato
			// para no causar errores
			
			// Dependerá de nosotros decidir si mantenemos esta implementación
			// o que pare el programa y mencione el error
      endcase  
   end  
endmodule 