module acionarDisplay(output [7:0] segmentos, 
	output D1,D2,D3,D4, 
	input[1:0] estado, //MEF Principal
	input [3:0] produto, 
	input [3:0] valorMoedas, 
	input devolver,
	input clk);

	wire [1:0] cont_out;
	reg[3:0] L1, L2, L3, L4, vM1, vM2, vM3;
	wire[3:0] letraAtual;
	reg[3:0] codigo1, codigo2;


	always @(valorMoedas) begin  //Equivalencias para apresentar as moedas no display
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
			default: begin 
				vM1 <= 0000;
				vM2 <= 0000;
				vM3 <= 0000;
			end
		endcase
	end
	
	always @(produto) begin  //Equivalencias para apresentar o codigo no display
		case (produto)
				4'b0000: begin     // refri
            codigo1<=4'b0000;
				codigo2<=4'b0000;
        end
            4'b0100: begin     // salgadinhos
            codigo1<=4'b0001;
				codigo2<=4'b0000;
        end
            4'b0101: begin     // amendoim
            codigo1<=4'b0001;
				codigo2<=4'b0001;
        end
            4'b1000: begin     //agua
            codigo1<=4'b0010;
				codigo2<=4'b0000;
        end
            4'b1001: begin     //suco
            codigo1<=4'b0010;
				codigo2<=4'b0001;
        end
            4'b1010: begin     // agua de coco
            codigo1<=4'b0010;
				codigo2<=4'b0010;
        end
            4'b1011: begin     // cafe
            codigo1<=4'b0010;
				codigo2<=4'b0011;
        end
            4'b1100: begin     //sanduiche
            codigo1<=4'b0011;
				codigo2<=4'b0000;
        end
            4'b1101: begin     //sanduiche nat
            codigo1<=4'b1100;
				codigo2<=4'b0001;
        end
		  default: begin
		  codigo1 <= 4'b0000;
		  codigo2 <= 4'b0000;
		  end
		  endcase
	end
		


	always @(estado) begin 
		case(estado)
			
			2'b00: begin   //Espera
			L1 <= 4'b0000; //O
			L2 <= 4'b1001; //P
			L3 <= 4'b0110; //E
			L4 <= 4'b1000; //n
			end
		
			2'b01: begin // //Produto
				if(produto==4'b1111) begin
				L1 <= 4'b0110; //E
				L2 <= 4'b0100; //4
				L3 <= 4'b0000; //0
				L4 <= 4'b0100; //4
				end
				else begin
					L1<=codigo1;
					L2<=codigo2;
					L3<=4'b1111;
					L4<=4'b1111;

				end
			end
			
			2'b10: begin //Comparador 
				L1 <= vM1; 	   //1
				L2 <= 4'b1010; //.
				L3 <= vM2;     //7
				L4 <= vM3; 	   //5
				if(devolver) begin							
					L1 <= 4'b0110; //E //VALOR INSERIDO ERRADO
					L2 <= 4'b0100; //4
					L3 <= 4'b0000; //0
					L4 <= 4'b0101; //5
				end
			end

			default: begin 	//ESPERA - STANDBY
			L1 <= 4'b0000; //O
			L2 <= 4'b1001; //P
			L3 <= 4'b0110; //E
			L4 <= 4'b1000; //n
			end
		
		endcase			
	end

	count contador(.clk(clk),.max(3),.out(cont_out));
	
	demux selecionarDigito(.S(cont_out),.G(1),.D1(D1),.D2(D2),.D3(D3),.D4(D4));
	
	mux_4bits selecionarLetra(.a(L1), .b(L2), .c(L3), .d(L4), .selbit(cont_out), .out(letraAtual));
	
	decodificador decoder7segs(.E(letraAtual), .s(segmentos));
	
	
	
	
endmodule	
	
