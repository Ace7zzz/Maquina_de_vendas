    module controleDigitos (input wire clk, input wire enable, input wire tempoLimite, input wire OK, output reg enableLinha, enableColuna, clear);

    reg[1:0] estadoAtual, proxEstado;

    localparam ESPERA = 2'b00,
            LINHA = 2'b01,
            COLUNA = 2'b10,
            BLOQUEADO = 2'b11
            ;


    always @(posedge clk)  begin
        estadoAtual <= proxEstado;
    end


    always @(estadoAtual or tempoLimite or OK) begin
        proxEstado <= estadoAtual;
        case (estadoAtual)
            ESPERA: begin
                if (enable) 
                    proxEstado <= LINHA;
            end
            LINHA: begin
            if (!enable & tempoLimite)
                    proxEstado <= ESPERA;
            else if (enable)
                    proxEstado <= COLUNA;
            end
            COLUNA: proxEstado <= BLOQUEADO;
            BLOQUEADO: begin
                if (OK)
                    proxEstado <= ESPERA; 
            end 
        endcase    
        
    end


    always @(estadoAtual) begin
        case (estadoAtual)
            LINHA: begin
                enableLinha <= 1'b1;
                enableColuna <= 1'b0;
                clear <= 1'b0;
            end 
            COLUNA: begin
                enableLinha <= 1'b0;
                enableColuna <= 1'b1;
                clear <= 1'b0;
            end
            BLOQUEADO: begin
                enableLinha <= 1'b0;
                enableColuna <= 1'b0;
                clear <= 1'b0;
            end
            default: begin
            enableLinha <= 1'b0;
            enableColuna <= 1'b0;
            clear <= 1'b1;
            end 
        endcase    
    end


endmodule
