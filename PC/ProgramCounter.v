////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 3 (PreLab)
// Module - pc_register.v
// Description - 32-Bit program counter (PC) register.
//
// INPUTS:-
// Address: 32-Bit address input port.
// Reset: 1-Bit input control signal.
// Clk: 1-Bit input clock signal.
//
// OUTPUTS:-
// PCResult: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design a program counter register that holds the current address of the 
// instruction memory.  This module should be updated at the positive edge of 
// the clock. The contents of a register default to unknown values or 'X' upon 
// instantiation in your module. Hence, please add a synchronous 'Reset' 
// signal to your PC register to enable global reset of your datapath to point 
// to the first instruction in your instruction memory (i.e., the first address 
// location, 0x00000000H).
////////////////////////////////////////////////////////////////////////////////

// Vamos a modificar el programa suponiendo que tenemos 31 registros

module ProgramCounter(

	input       [4:0]  PCNext,
	input               Reset, Clk,PCWrite,

	output reg  [4:0]  PCResult
);

	reg	[4:0]  TempPCResult;

    /* Please fill in the implementation here... */

	initial begin
	
		PCResult <= 5'b00000;
		TempPCResult <= 5'b00000;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    	begin
    		PCResult <= 5'b00000;
			TempPCResult <= 5'b00000;
    	end
    	else
    	begin
			if (PCWrite == 0)
			begin
				PCResult = TempPCResult; // Restaurar el valor de PCResult
				TempPCResult = PCResult + 1; // Guardar el nuevo valor de PCResult en TempPCResult
			end
			else
			begin
				PCResult = PCNext;
		end
    	end
    end

endmodule
