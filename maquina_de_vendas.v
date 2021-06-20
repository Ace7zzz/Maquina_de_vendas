module maquina_de_vendas (
    input [3:0] tecla,
    input [1:0] moeda,
    input clk,
    output [7:0] segmentos, 
	output D1,D2,D3,D4,
    output LP, DM
	/*,
	 output [1:0] state,//
	 output timeOut,//
	 output existeProduto,
	 output ativarSele, 
	 output [3:0]valorAcumulador*/

);
//assign valorAcumulador = valAcumulado;
//assign ativarSele = ativar;
//assign existeProduto = existe;
//assign timeOut = tO_mefDig;
//assign state = estados;
wire[1:0] codigo, linha, coluna, estados;
wire press, CD, reset_comp, not_E0, not_E1;
wire notEP, EL_regs, EC_regs, CLR_regs;
wire tO_mefDig;     //
wire [2:0] valorComparar;
wire [3:0] codProd;
wire existe;
wire [3:0] valAcumulado;
wire clk_1Hz;
wire ativar;
wire [1:0]eMef1;
codificadorTeclado codificadorTeclado(tecla, codigo, press);

controleDigitos controleDigitos(clk, press, tO_mefDig, fim_dig,
 EL_regs, EC_regs, CLR_regs, eMef1);

registradores regs(clk, EL_regs, EC_regs, CLR_regs, codigo, linha, coluna);

and(ativar, eMef1[0], eMef1[1]);

selecionador selecionador(ativar,linha, coluna,valorComparar, codProd, existe);
wire fim_dig;
or (fim_dig, notEP, OK);
not(notEP, existe);		// NO LUGAR DE notEP -> FIM + notEP
wire OK;

timeOut temporizador (.clk(clk1Hz), .clk15segs(tO_mefDig));

timeOut5segs temp5segs (.clk(clk1Hz), .iniciar(ativar), .clk5segs(TS));

wire TS;
controlePrincipal mef_principal (clk, ativar, TS , existe, OK, estados);
not (not_E1, estados[1]);
not (not_E0, estados[0]);
and(reset_comp, not_E0, not_E1);        // reset comparador quando MEF_PRINCIPAL for 00

acumulador acumulador (.clk(clk), .reset(), .tempoLimite(tO_mefDig), 
.valorMoeda(moeda), .valorAcumulado(valAcumulado));

comparador comparador (.valorMoedas(valAcumulado),
		.valorProduto(valorComparar),
		.enable(tO_mefDig), .reset(reset_comp),
		.liberarProduto(LP), .devolverMoedas(DM),
		.valorTotal(valorTot));
wire valorTot;
reg_fim final (.LP(LP), .DM(DM), .clk(clk1Hz),
    .FIM(OK));

clk_1Hz clk_1HZ (.clk(clk), .out1Hz(clk1Hz));
clkVis clkDisplay(
    .clk(clk),
    .clkDisplay(clkVis)
);
wire clkVis;
acionarDisplay display (.segmentos(segmentos), 
	.D1(D1), .D2(D2), .D3(D3), .D4(D4), 
	.estado(estados), //MEF Principal
	.produto(codProd), 
	.valorMoedas(valAcumulado), 
	.devolver(DM),
	.clk(clkVis));
endmodule 