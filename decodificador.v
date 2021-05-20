module decodificador(output reg a,b,c,d,e,f,g, input [3:0] E);

always @(E) begin
	case(E)
		4'b0000: begin  //O
			a<=1;
			b<=1;
			c<=1;
			d<=1;
			e<=1;
			f<=1;
			g<=0;
		end
		
		4'b0001: begin  //1
			a<=0;
			b<=1;
			c<=1;
			d<=0;
			e<=0;
			f<=0;
			g<=0;
		end
		
		4'b0010: begin  //2
			a<=1;
			b<=1;
			c<=0;
			d<=1;
			e<=1;
			f<=0;
			g<=1;
		end
		
		4'b0011: begin  //3
			a<=1;
			b<=1;
			c<=1;
			d<=1;
			e<=0;
			f<=0;
			g<=1;
		end
		
		4'b0100: begin //4
			a<=0;
			b<=1;
			c<=1;
			d<=0;
			e<=0;
			f<=1;
			g<=1;
		end
		
		4'b0101: begin //5
			a<=1;
			b<=0;
			c<=1;
			d<=1;
			e<=0;
			f<=1;
			g<=1;
		end
		
		4'b0110: begin  //C
			a<=1;
			b<=0;
			c<=0;
			d<=1;
			e<=1;
			f<=1;
			g<=0;
		end
		
		4'b0111: begin  //E
			a<=1;
			b<=0;
			c<=0;
			d<=1;
			e<=1;
			f<=1;
			g<=1;
		end
		
		4'b1000: begin  //I
			a<=0;
			b<=0;
			c<=0;
			d<=0;
			e<=1;
			f<=1;
			g<=0;
		end
		
		4'b1001: begin  //n
			a<=0;
			b<=0;
			c<=1;
			d<=0;
			e<=1;
			f<=0;
			g<=1;
		end
		
		4'b1010: begin  //P
			a<=1;
			b<=1;
			c<=0;
			d<=0;
			e<=1;
			f<=1;
			g<=1;
		end
		
		default: begin
			a<=0;
			b<=0;
			c<=0;
			d<=0;
			e<=0;
			f<=0;
			g<=0;
		end
	endcase;
end
//mudanças	
endmodule
