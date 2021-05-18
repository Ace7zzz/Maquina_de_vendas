module mux_4bits( input wire [3:0] a, b, c, d, input wire [1:0] selbit, output reg [3:0] out);

always @ (selbit) begin
	case(selbit)
		0 : out <= a;
		1 : out <= b;
		2 : out <= c;
		3 : out <= d;
		default : out <= 0;
	endcase
end

endmodule
 