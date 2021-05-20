module acionarDisplay(output a,b,c,d,e,f,g,D1,D2,D3,D4, input[2:0] estado, input [1:0] num1, num2, input clk);

	wire [1:0] cont_out;
	reg[3:0] L1, L2, L3, L4;
	wire[3:0] letraAtual;
	
	//comentario de amanda
	//mais um comentario
	
	always @(estado or num1 or num2) begin
		case(estado)
			0: begin //ESPERA - STANDBY
			L1 <= 4'b0000; //O
			L2 <= 4'b1010; //P
			L3 <= 4'b0111; //E
			L4 <= 4'b1001; //n
			end
			
			1: begin //CÓDIGO ERRADO - PRODUTO NÃO EXISTE
			L1 <= 4'b0111; //E
			L2 <= 4'b0100; //4
			L3 <= 4'b0000; //0
			L4 <= 4'b0100; //4
			end
			
			2: begin //VALOR INSERIDO ERRADO
			L1 <= 4'b0111; //E
			L2 <= 4'b0100; //4
			L3 <= 4'b0000; //0
			L4 <= 4'b0101; //5
			end
			
			3: begin // AGUARDANDO MOEDAS
			L1 <= 4'b0110; //C
			L2 <= 4'b0000; //O
			L3 <= 4'b1000; //I
			L4 <= 4'b1001; //n
			end
			
			4: begin // DIGITAÇÃO
			L1 <= num1;
			L2 <= num2;
			L3 <= 4'b1111;
			L4 <= 4'b1111;
			end
		endcase			
	end

	count contador(.clk(clk),.max(3),.out(cont_out));
	
	demux selecionarDigito(.S(cont_out),.G(1),.D1(D1),.D2(D2),.D3(D3),.D4(D4));
	
	mux_4bits selecionarLetra(.a(L1), .b(L2), .c(L3), .d(L4), .selbit(cont_out), .out(letraAtual));
	
	decodificador decoder7segs(.E(letraAtual), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
	
	
	
	
endmodule	
	
