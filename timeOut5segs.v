module timeOut5segs (
	input clk,
	input iniciar,
	output reg clk5segs
	);
	
	reg [2:0] contar;
	reg iniciou;
	
	always @ (posedge clk) begin
		if (clk5segs) begin
			clk5segs <= 0;
		end
		if(iniciar)
			iniciou <=1;
		if(iniciou)
			contar <= contar + 1;
		if (contar == 3'b101) begin 	// contar ate 5
			clk5segs <= 1;
		end 
	end 
endmodule 