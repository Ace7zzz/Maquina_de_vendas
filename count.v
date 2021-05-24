module count(out, clk, max, reset);
   output reg [1:0] out;
	input [1:0] max;
	input clk;
	input wire reset;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			out <= 0;
		end
		else if(out==max) begin
			out <=0;
		end
		else begin
			out <= out + 1;
		end
	end
	
	
endmodule 