module acumula_compara (
    input CLK, rst, rstC, TL, 
	 input [1:0] VM,
	 input [2:0] vProduto,
     output LP, DM, output [3:0] vTotal);

wire [3:0] vAcumulado;

acumulador AC (.clk(CLK), .reset(rst), .tempoLimite(TL), .valorMoeda(VM), 
                .valorAcumulado(vAcumulado));
comparador COMP (
		.valorMoedas(vAcumulado),
		.valorProduto(vProduto),    // que vai vir do selecionador
		.enable(TL),                // tempo limite
		.reset(rstC),
		.liberarProduto(LP), .devolverMoedas(DM),
		.valorTotal(vTotal));
endmodule 