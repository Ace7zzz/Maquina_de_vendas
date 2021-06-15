module teclado (
input [3:0] in,
output reg [3:0] out
);

always @ (in) begin
	if (in[0] != 0) begin
	out <= 3'b111;
	end
	else if (in[1] != 0) begin
	out <= 3'b001;
	end
	else if (in[2] != 0) begin
	out <= 3'b010;
	end
	else if (in[3] != 0) begin
	out <= 3'b011;
	end
	else begin
	out <= 3'b000;
	end
end
endmodule 