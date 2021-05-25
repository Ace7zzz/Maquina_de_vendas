module acionarDisplay(output [7:0] segmentos, D1,D2,D3,D4, input[2:0] estado, input [1:0] num1, num2, input [3:0] valorMoedas, input clk);

	wire [1:0] cont_out;
	reg[3:0] L1, L2, L3, L4, vM1, vM2, vM3;
	wire[3:0] letraAtual;


	always @(valorMoedas) begin 
		case (valorMoedas)

			4'b0001: begin //0,25
        		vM1 <= 0000;
        		vM2 <= 0010;
        		vM3 <= 0101;
			end

			4'b0010: begin //0,50
        		vM1 <= 0000;
        		vM2 <= 0101;
        		vM3 <= 0000;
			end

			4'b0100: begin //1,00
				vM1 <= 0001;
				vM2 <= 0000;
				vM3 <= 0000;
			end

			4'b0101: begin //1,25
				vM1 <= 0001;
				vM2 <= 0010;
				vM3 <= 0101;
			end
			
			4'b0110: begin //1,50
				vM1 <= 0001;
				vM2 <= 0101;
				vM3 <= 0000;
			end
			
			4'b0111: begin //1,75
				vM1 <= 0001;
				vM2 <= 0111;
				vM3 <= 0101;
			end

			4'b1000: begin //2,00
				vM1 <= 0010;
				vM2 <= 0000;
				vM3 <= 0000;
			end
				default: 
				vM1 <= 0000;
				vM2 <= 0000;
				vM3 <= 0000;
					default: 
				endcase
				
			end


	always @(estado or num1 or num2) begin
		case(estado)
			0: begin // DIGITAÇÃO
			L1 <= num1;
			L2 <= num2;
			L3 <= 4'b1111;
			L4 <= 4'b1111;
			
			1: begin //CÓDIGO ERRADO - PRODUTO NÃO EXISTE
			L1 <= 4'b0110; //E
			L2 <= 4'b0100; //4
			L3 <= 4'b0000; //0
			L4 <= 4'b0100; //4
			end
			
			2: begin //VALOR INSERIDO ERRADO
			L1 <= 4'b0110; //E
			L2 <= 4'b0100; //4
			L3 <= 4'b0000; //0
			L4 <= 4'b0101; //5
			end
			
			3: begin // VALOR MOEDAS
			L1 <= vM1; 	   //1
			L2 <= 4'b1010; //.
			L3 <= vM2;     //7
			L4 <= vM3; 	   //5
			end

			default: begin 	//ESPERA - STANDBY
			L1 <= 4'b0000; //O
			L2 <= 4'b1001; //P
			L3 <= 4'b0110; //E
			L4 <= 4'b1000; //n
			end
				
			end
			
		endcase			
	end

	count contador(.clk(clk),.max(3),.out(cont_out));
	
	demux selecionarDigito(.S(cont_out),.G(1),.D1(D1),.D2(D2),.D3(D3),.D4(D4));
	
	mux_4bits selecionarLetra(.a(L1), .b(L2), .c(L3), .d(L4), .selbit(cont_out), .out(letraAtual));
	
	decodificador decoder7segs(.E(letraAtual), .s(segmentos));
	
	
	
	
endmodule	
	
