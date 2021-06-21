module clk_1Hz (input clk, output out1Hz);
reg [25:0] contar;
initial contar = 0;
assign out1Hz = contar [25];		// aprox. 0.7 Hz
always @ (posedge clk) begin
	contar <= contar + 1;
	if (contar == 26'h3FFFFFF) begin
		contar <= 26'h0;
		end
end

endmodule 