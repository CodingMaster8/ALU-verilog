`timescale 1ns/1ps

module mux2to1_tb();

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales
    reg clk;
    reg [31:0] a;
    reg [31:0] b;
    reg sel;
    wire [31:0] out;

    // Instancia del DUT (Design Under Test)
    mux2to1 uut (
        .clk(clk),
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    // Generación de clock
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Inicialización de las entradas
    initial begin
        clk = 0;
        a = 32'h00000001;
        b = 32'h00000002;
        sel = 0;
        
        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar la selección
        sel = 1;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar las entradas a y b
        a = 32'h00000003;
        b = 32'h00000004;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar la selección de nuevo
        sel = 0;

        // Esperar 10 unidades de tiempo
        #10;

        // Finalizar la simulación
        $finish;
    end

endmodule 