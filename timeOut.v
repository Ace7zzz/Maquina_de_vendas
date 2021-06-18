module timeOut (
	input clk,
	output clk30segs
	);
	
	reg [3:0] contar;
	assign clk30segs = contar[3];
	
	always @ (posedge clk) begin
		contar <= contar + 1;
		if (contar == 4'b1111) begin
			contar <= 4'b0;
		end
	end
endmodule 