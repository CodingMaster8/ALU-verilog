`timescale 1ns/1ps

module mux3to1_tb();

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales
    reg clk;
    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] c;
    reg [1:0] sel;
    wire [31:0] out;

    // Instancia del DUT (Design Under Test)
    mux3to1 uut (
        .clk(clk),
        .a(a),
        .b(b),
        .c(c),
        .sel(sel),
        .out(out)
    );

    // Generación de clock
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Inicialización de las entradas
    initial begin
        clk = 1;
        a = 32'h00000001;
        b = 32'h00000002;
        c = 32'h00000003;
        sel = 2'b00;
        
        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar la selección a b
        sel = 2'b01;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar la selección a c
        sel = 2'b10;

        // Esperar 10 unidades de tiempo
        #10;
		  
		  // Cambiar la selección a b
        sel = 2'b01;
		  
		  // Esperar 10 unidades de tiempo
        #10;

        // Cambiar la selección a una entrada no válida
        sel = 2'b11;

        // Esperar 10 unidades de tiempo
        #10;

        // Finalizar la simulación
        $finish;
    end

endmodule 