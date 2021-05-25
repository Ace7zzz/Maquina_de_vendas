module decodificador(output reg [7:0] s, input [3:0] E);

//abcdefg.

always @(E) begin
	case(E)
		4'b0000: s<=11111100; //O
		4'b0001: s<=01100000; //1
		4'b0010: s<=01100000; //2
		4'b0011: s<=11011010; //3
		4'b0100: s<=01100110; //4
		4'b0101: s<=10110110; //5
		4'b0110: s<=10011110; //E
		4'b0111: s<=11100000; //7
		4'b1000: s<=00101010; //n
		4'b1001: s<=11001110; //P
		4'b1010: s<=00000001; //.
		default: s<=00000000;
	endcase;
end

endmodule
