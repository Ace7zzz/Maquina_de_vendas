module reg_fim (
    input LP, DM, clk,      // liberar produto, devolver moeda, clock(dividido, 1seg)
    output wire FIM
);
    wire or_D3, Q3_D2, Q2_D1, Q1_D0, Q0_FIM;
    or LP_DM (or_D3, LP, DM);

    DFF D3(.D(or_D3), .CLK(clk), .Q(Q3_D2));
    DFF D2(.D(Q3_D2), .CLK(clk), .Q(Q2_D1));
    DFF D1(.D(Q2_D1), .CLK(clk), .Q(Q1_D0));
    DFF D0(.D(Q1_D0), .CLK(clk), .Q(Q0_FIM));
	assign FIM = Q0_FIM;
endmodule 

module DFF (    //flip-flop tipo D
    input D, CLK,
    output reg Q
);
always @ (posedge CLK) begin
    Q <= D;
end
endmodule