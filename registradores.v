module registradores( 
	input clk, enL, enC, clr,
	input [1:0] code,
	output reg[1:0] linha, coluna
	);
	
	reg [1:0]codeL, codeC;
	
	
	always @(posedge clk or posedge clr) begin
		if(clr) begin
			codeL <= 2'b00;
			codeC <= 2'b00;
			linha <= codeL;
			coluna <= codeC;
		end
		
		else begin
			if(enL) begin
				codeL <= code;
				linha <= code;
			end
			else if (enC) begin
				codeC <= code;
				coluna <= code;
			end
			else begin
				linha <= codeL;
				coluna <= codeC;
			end
		end
	end
	
endmodule
		
		
		
	
	
	
	