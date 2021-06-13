module acumuladorMEF(input wire clk, input wire tempoLimite, input wire [1:0] valorMoeda, output wire comparar, output wire [3:0] valorAcumulado);

    reg [3:0] estadoAtual, proxEstado;

    localparam E0_00 = 4'b0000,   //0,00 - Estado Inicial
               E0_25 = 4'b0001,   //0,25
               E0_50 = 4'b0010,   //0,50
               E0_75 = 4'b0011,   //0,75
               E1_00 = 4'b0100,   //1,00
               E1_25 = 4'b0101,   //1,25
               E1_50 = 4'b0110,   //1,50
               E1_75 = 4'b0111,   //1,75
               E2_00 = 4'b1000,   //2,00


               // Valor Moedas
               0_25 = 2'b01,
               0_50 = 2'b10,
               1_00 = 2'b11,


               //Estados Inválidos

               E_INV1=  4'b1001,
               E_INV2 = 4'b1010,
               E_INV3 = 4'b1011,
               E_INV4 = 4'b1100,
               E_INV5 = 4'b1101,
               E_INV6 = 4'b1110,
               E_INV7 = 4'b1111;


    always @(posedge clk) begin   // atualização do estado e da saída comparar
        if(tempoLimite) begin
            estadoAtual <= E0_00;
            comparar <= 1;
        end 
        else estadoAtual <= proxEstado;
    end
    
    always @(estadoAtual or valorMoeda) begin //Lógica de transição de estado e da saída valorAcumulado
        proxEstado <= estadoAtual;
        valorAcumulado <= 4'b0000;
        case (estadoAtual)
            E0_00: begin
                case (valorMoeda)
                0_25 : proxEstado <= E0_25;  
                0_50 : proxEstado <= E0_50;  
                1_00 : proxEstado <= E1_00;  
              endcase
            end
            E0_25: begin
                case (valorMoeda)
                0_25 : proxEstado <= E0_50;  
                0_50 : proxEstado <= E0_75;  
                1_00 : proxEstado <= E1_25; 
                endcase
            end

            E0_50: begin
                case (valorMoeda)
                0_25 : proxEstado <= E0_75;  
                0_50 : proxEstado <= E1_00;  
                1_00 : proxEstado <= E1_50; 
                endcase
            end

            E0_75: begin
                case (valorMoeda)
                0_25 : proxEstado <= E1_00;  
                0_50:  proxEstado <= E1_25;  
                1_00 : proxEstado <= E1_75; 
                endcase
            end

            E1_00: begin
               case (valorMoeda)
                0_25 : proxEstado <= E1_25;  
                0_50 : proxEstado <= E1_50;  
                1_00 : proxEstado <= E2_00; 
                endcase
            end

            E1_25: begin
               case (valorMoeda)
                0_25 : proxEstado <= E1_50;  
                0_50 : proxEstado <= E1_75;  
                1_00 : proxEstado <= E0_00; 
                endcase
            end


            E1_50: begin
               case (valorMoeda)
                0_25 : proxEstado <= E1_75;  
                0_50 : proxEstado <= E2_00;  
                1_00 : proxEstado <= E0_00; 
                endcase
            end

            E1_75: begin
               case (valorMoeda)
                0_25 : proxEstado <= E2_00;  
                0_50 : proxEstado <= E0_00;  
                1_00 : proxEstado <= E0_00; 
                endcase
            end

            E2_00: begin
               case (valorMoeda)
                0_25 : proxEstado <= E0_00;  
                0_50 : proxEstado <= E0_00;  
                1_00 : proxEstado <= E0_00; 
                endcase
            end
            default: proxEstado <= E0_00; //Estado Inválidos
            valorAcumulado <= proxEstado;
        endcase
    end


endmodule
