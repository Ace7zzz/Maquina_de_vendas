module comparador(
		input [3:0] valorMoedas,
		input [2:0] valorProduto,
		input enable, reset,
		output reg liberarProduto, devolverMoedas,
		output reg [3:0] valorTotal);
		
		
		always @(*) begin
			valorTotal <= valorMoedas;
			if (reset) begin
				liberarProduto <= 0;
				devolverMoedas <= 0;
			end
			if(enable) begin
				case(valorProduto)
				3'b001: begin
					if(valorMoedas == 4'b0010) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
					
				3'b010: begin
					if(valorMoedas == 4'b0100) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
					
				3'b011: begin
					if(valorMoedas == 4'b0101) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
					
				3'b100: begin
					if(valorMoedas == 4'b0110) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
				
				3'b101: begin
					if(valorMoedas == 4'b0111) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
					
				3'b110: begin
					if(valorMoedas == 4'b1000) begin
						liberarProduto <= 1;
						devolverMoedas <= 0;
					end
					else begin
						liberarProduto <= 0;
						devolverMoedas <= 1;
					end
				end
					
				default: begin
					liberarProduto <= 0;
					devolverMoedas <= 1;
				end
			endcase
			end
		end
endmodule
		
		
		
		