module selecionador (
    input  wire [1:0] linha, coluna,
	 output reg [2:0] valor,
    output reg [3:0] codeOut,
    output reg existe
);
reg [3:0] code;
always @ (linha or coluna) begin
    code = {linha[1], linha[0], coluna[1], coluna[0]};
    case (code)
				4'b0000: begin     // refri
            codeOut <= code;
            valor <= 3'b010;
            existe <= 1;
        end
            4'b0100: begin     // salgadinhos
            codeOut <= code;
            valor <= 3'b110;
            existe <= 1;
        end
            4'b0101: begin     // amendoim
            codeOut <= code;
            valor <= 3'b001;
            existe <= 1;
        end
            4'b1000: begin     //agua
            codeOut <= code;
            valor <= 3'b001;    
            existe <= 1;
        end
            4'b1001: begin     //suco
            codeOut <= code;
            valor <= 3'b011;
            existe <= 1;
        end
            4'b1010: begin     // agua de coco
            codeOut <= code;
            valor <= 3'b101;
            existe <= 1;
        end
            4'b1011: begin     // cafe
            codeOut <= code;
            valor <= 3'b100;
            existe <= 1;
        end
            4'b1100: begin     //sanduiche
            codeOut <= code;
            valor <= 3'b010;
            existe <= 1;
        end
            4'b1101: begin     //sanduiche nat
            codeOut <= code;
            valor <= 3'b101;
            existe <= 1;
        end
        default: begin      //prod inexistente
            existe <= 0;
            codeOut <= 4'b1111;
            valor <= 0;
        end
    endcase
end

endmodule
