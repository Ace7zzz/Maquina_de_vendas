module selecionador (
    input [2:0] linha, coluna, valor,
    output [3:0] cod,
    output existe,
);
reg [3:0] code;
always @ (linha or coluna) begin
    code = {linha[1], linha[0], coluna[1], coluna[0]};
    case (code)
        0000: begin     // refri
            cod <= code;
            valor <= 3'b010;
            existe <= 1;
        end
            0100: begin     // salgadinhos
            cod <= code;
            valor <= 3'b110;
            existe <= 1;
        end
            0101: begin     // amendoim
            cod <= code;
            valor <= 3'b001;
            existe <= 1;
        end
            1100: begin     //agua
            cod <= code;
            valor <= 3'b001;    
            existe <= 1;
        end
            1101: begin     //suco
            cod <= code;
            valor <= 3'b011;
            existe <= 1;
        end
            1111: begin     // agua de coco
            cod <= code;
            valor <= 3'b101;
            existe <= 1;
        end
            1110: begin     // cafe
            cod <= code;
            valor <= 3'b100;
            existe <= 1;
        end
            1000: begin     //sanduiche
            cod <= code;
            valor <= 3'b010;
            existe <= 1;
        end
            1001: begin     //sanduiche nat
            cod <= code;
            valor <= 3'b101;
            existe <= 1;
        end
        default: begin      //prod inexistente
            existe <= 0;
            cod <= 0;
            valor <= 0;
        end
    endcase
end

endmodule