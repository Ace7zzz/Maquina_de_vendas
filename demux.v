module demux(output reg D1, D2, D3, D4, input [1:0] S, input G);

initial begin
	D1<=0;
	D2<=0;
	D3<=0;
	D4<=0;
end

always @(S) begin
	case(S) 
		0: begin 
			D1 <= G;
			D2 <= 0;
			D3 <= 0;
			D4 <= 0;
		end
		1: begin 
			D2 <= G;
			D1 <= 0;
			D3 <= 0;
			D4 <= 0;
		end
		2: begin 
			D3 <= G;
			D1 <= 0;
			D2 <= 0;
			D4 <= 0;
		end
		3: begin 
			D4 <= G;
			D1 <= 0;
			D2 <= 0;
			D3 <= 0;
		end
	endcase
end


endmodule



		