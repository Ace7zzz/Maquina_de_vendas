module maquina_de_vendas (
    input [3:0] tecla,
    input [1:0] moeda,
    input clk,
    output [7:0] segmentos, 
	output D1,D2,D3,D4,
    output LP, DM
);
wire[1:0] codigo, linha, coluna;
wire press, CD;
wire notEP, EL_regs, EC_regs, CLR_regs;
wire tO_mefDig;
wire [2:0] valorComparar;
wire [3:0] codProd;
wire existe;
wire [3:0] valAcumulado;

codificadorTeclado codificadorTeclado(tecla, codigo, press);

controleDigitos controleDigitos(clk, press, .tempoLimite(tO_mefDig), notEP, EL_regs, EC_regs, CLR_regs);

registradores regs(clk, EL_regs, EC_regs, CLR_regs, codigo, linha, coluna);

selecionador selecionador(linha, coluna,valorComparar, codProd, existe);

not(notEP, existe);		// NO LUGAR DE notEP -> FIM + notEP

timeOut temporizador (.clk(clk), .clk30segs(tO_mefDig));

controlePrincipal mef_principal (clk, EC, existe, OK, estados);

acumulador acumulador (input wire clk, input wire reset, input wire tempoLimite, 
input wire [1:0] valorMoeda, .valorAcumulado(valAcumulado));

comparador comparador (.valorMoedas(valAcumulado),
		.valorProduto(valorComparar),
		.enable(tO_mefDig), .reset(),
		output reg liberarProduto, devolverMoedas,
		output reg [3:0] valorTotal);

endmodule 