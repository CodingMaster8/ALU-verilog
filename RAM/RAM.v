module RAM (
    input clk,                          // Entrada del reloj
    input [15:0] data_in,               // Datos de entrada a escribir en la memoria
    input [4:0] address,                // Dirección de memoria para leer o escribir
    input wrenable, rdenable,           // Señales de control para escribir o leer
    output reg [15:0] data_out          // Datos de salida leídos desde la memoria
);

reg [15:0] memory [0:31];               // Declaración de una matriz de registros para almacenar datos de 32 palabras de 16 bits

always @(posedge clk) begin
    if (wrenable) begin                 // Si la señal de escritura está habilitada
        memory[address] <= data_in;     // Se escribe el dato de entrada en la ubicación de memoria especificada
    end

    if (rdenable) begin                 // Si la señal de lectura está habilitada
        data_out <= memory[address];    // Se lee el dato almacenado en la ubicación de memoria especificada
    end
end

endmodule
