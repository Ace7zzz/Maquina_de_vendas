module controlePrincipal (input wire clk, input wire codigoDigitado, input wire TS,  
input wire existeProduto, input wire OK, output reg [1:0] estados);

reg[1:0] estadoAtual, proxEstado;

 localparam ESPERA = 2'b00,
            PRODUTO = 2'b01,
            COMPARADOR = 2'b10,

            //Estado Inválido
            INVALIDO = 2'b11;




always @(posedge clk ) begin
    estadoAtual <= proxEstado;
end


always @(estadoAtual or OK or codigoDigitado or existeProduto or TS) begin
    proxEstado <= estadoAtual;
    case (estadoAtual)
        ESPERA: begin
          if(codigoDigitado)
            proxEstado <= PRODUTO;
        end 
        PRODUTO: begin
            if(existeProduto & TS)
                proxEstado <= COMPARADOR;
            else if(!existeProduto & TS)
                proxEstado <= ESPERA;
        end
        COMPARADOR: begin
            if(OK)
                proxEstado <= ESPERA;
        end
        default: proxEstado <= ESPERA;
    endcase
end


always @(estadoAtual) begin
    case (estadoAtual)
        PRODUTO: begin
          estados <= 2'b01;
        end 
        COMPARADOR: begin
          estados <= 2'b10;
        end
        default: estados <= 2'b00;
    endcase
    
end





endmodule 