module timeOut (
	input clk,
	output reg clk15segs
	);
	
	reg [3:0] contar;
	
	always @ (posedge clk) begin
		if (clk15segs) begin
			clk15segs <= 0;
		end
		contar <= contar + 1;
		if (contar == 4'd15) begin 	// contar ate 15
			clk15segs <= 1;
		end 
	end 
endmodule 