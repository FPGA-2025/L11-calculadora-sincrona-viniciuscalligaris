module calculadora_sincrona(
    input clk,
    input rst,
    input [7:0] entrada,
    input [2:0] codigo,
    output reg [7:0] saida
);
    reg [7:0] acumulador;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acumulador <= 8'b0;
            saida <= 8'b0;
        end else begin
            case (codigo)
                3'b000: saida <= entrada;

                3'b001: begin
                    acumulador <= acumulador + entrada;
                    saida <= 8'b0;
                end
                3'b010: begin 
                    acumulador <= acumulador - entrada;
                    saida <= 8'b0;
                end
                
                3'b011: saida <= acumulador;
             
                default: saida <= 8'b0;
            endcase
        end
    end

endmodule