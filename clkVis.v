module clkVis(
    input clk,
    output clkDisplay
);
reg [15:0] contar;
assign clkDisplay = contar[3]; // 763 Hz aprox.
always @ (posedge clk) begin
    contar <= contar + 1;
    if (contar == 16'hFFFF) begin
        contar <= 16'h0;
    end
end
endmodule
