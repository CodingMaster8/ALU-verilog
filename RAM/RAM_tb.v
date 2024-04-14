`timescale 1ns/1ns

module RAM_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo del relojde 10ns
    
    // Señales de prueba
    reg clk;
    reg [15:0] data_in;
    reg [4:0] address;
    reg wrenable, rdenable;
    wire [15:0] data_out;

    // Instanciar el módulo de RAM
    RAM DUT (
        .clk(clk),
        .data_in(data_in),
        .address(address),
        .wrenable(wrenable),
        .rdenable(rdenable),
        .data_out(data_out)
    );

    // Generar un reloj
    always #((CLK_PERIOD)/2) clk = ~clk;

    initial begin
        clk = 0; // Iniciar el reloj en bajo
        // Escritura en la memoria
        wrenable = 1;
        rdenable = 0;
        address = 0; // Dirección de memoria a escribir
        data_in = 16'h1234; // Datos a escribir en la primera memoria
        #20; // Esperar un tiempo
        address = 1; // Dirección de memoria a escribir
        data_in = 16'h5678; // Datos a escribir en la segunda memoria
        #20; // Esperar un tiempo
        address = 2; // Dirección de memoria a escribir
        data_in = 16'h9ABC; // Datos a escribir en la tercera memoria
        #20; // Esperar un tiempo
        address = 3; // Dirección de memoria a escribir
        data_in = 16'hDEF0; // Datos a escribir en la cuarta memoria
        #20; // Esperar un tiempo
        address = 4; // Dirección de memoria a escribir
        data_in = 16'hFEDC; // Datos a escribir en la quinta memoria
        #20; // Esperar un tiempo
        // Lectura de la memoria
        wrenable = 0;
        rdenable = 1;
        address = 0; // Dirección de memoria a leer
        #20; // Esperar un tiempo
        address = 2; // Dirección de memoria a leer
        #20; // Esperar un tiempo
        address = 3; // Dirección de memoria a leer
        #20; // Esperar un tiempo
        address = 4; // Dirección de memoria a leer
        #20; // Esperar un tiempo
        address = 1; // Dirección de memoria a leer
        #20; // Esperar un tiempo
        $stop;
    end

endmodule
