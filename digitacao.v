module digitacao(input clk, tempoLimite, OK,  input[3:0] tecla, output [2:0] valor, output [3:0] produto, output existe , output [1:0] estados, output EL, EC, CLEAR);
		
		// módulo de testes de digitacao
		
		wire[1:0] codigo, linha, coluna;
		wire press, CD;
		wire notEP;
		
		
		codificadorTeclado codificadorTeclado(tecla, codigo, press);
		
		controleDigitos controleDigitos(clk, press, tempoLimite, notEP, EL, EC, CLEAR);
		
		registradores regs(clk, EL, EC, CLEAR, codigo, linha, coluna);
		
		selecionador selecionador(linha, coluna,valor, produto, existe);
		
		not(notEP, existe);
		
		
		controlePrincipal(clk, EC, existe, OK, estados);
		
endmodule

