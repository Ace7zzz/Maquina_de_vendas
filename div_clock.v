module div_clock (input clk, output out1Hz, outVis, timeOut);
reg [25:0] contar;
initial contar = 0;
assign out1Hz = contar [25];
assign outVis = contar [3];
always @(posedge clock) begin
    contar <= contar + 1;
    if (contar == 26'h3FFFFFF‬) begin
        contar <= 26'h0;
    end
end

reg [4:0] contar2;
assign timeOut = contar2[4];
always @ (posedge contar[25]) begin     // a cada segundo
    contar2 <= contar2 + 1;
    if (contar2 == 5'b11111) begin      // 30 segundos de contagem
        contar2 <= 5'b00000;
    end
end
endmodule 