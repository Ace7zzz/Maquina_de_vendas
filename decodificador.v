module decodificador(output reg segmentos[7:0], input [3:0] E);

//abcdefg.

always @(E) begin
	case(E)
		4'b0000: segmentos<=11111100; //O
		4'b0001: segmentos<=01100000; //1
		4'b0010: segmentos<=01100000; //2
		4'b0011: segmentos<=11011010  //3
		4'b0100: segmentos<=01100110; //4
		4'b0101: segmentos<=10110110; //5
		4'b0110: segmentos<=10011110; //E
		4'b0111: segmentos<=00101010; //n
		4'b1000: segmentos<=11001110; //P
		4'b1001: segmentos<=00000001; //.
		default: segmentos<=00000000;
	endcase;
end

endmodule
