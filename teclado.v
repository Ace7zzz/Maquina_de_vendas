module teclado (
input [3:0] in,
output reg [2:0] out0, out1, out2, out3,
output wire press
);
assign press <= 1'b0;	// volta para 0 sempre que o modulo for chamado
always @ (in) begin
	if (in[1] != 0) begin	// caso a tecla 1 seja pressionada
	out1 <= 2'b01;
	press <= 1'b1;
	end
	else if (in[2] != 0) begin	// caso a tecla 2 seja pressionada
	out2 <= 2'b10;
	press <= 1'b1;
	end
	else if (in[3] != 0) begin		// caso a tecla 3 seja pressionada
	out3 <= 2'b11;
	press <= 1'b1;
	end
	else begin		// caso a tecla 0 seja pressionada
	out0 <= 2'b00;
	press <= 1'b1;
	end
end
endmodule 