module teclado (
input [3:0] in,
output reg [2:0] out
);

always @ (in) begin
	if (in[0] != 0) begin
	out <= 2'b00;
	end
	else if (in[1] != 0) begin
	out <= 2'b01;
	end
	else if (in[2] != 0) begin
	out <= 2'b10;
	end
	else begin
	out <= 2'b11;
	end
end
endmodule 