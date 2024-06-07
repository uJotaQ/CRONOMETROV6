module duzen_min (CLK_IN, P, H, M, L, A, G, adm, bdm, cdm, ddm, edm, fdm, gdm);

	input CLK_IN, P, H, M, L, A, G;
	
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	wire SET0, SET1, RST0, RST1;
	
	duzen_min_set_reset dmsr(P, H, M, L, A, G, SET0, SET1, RST0, RST1);
	
	and(w1, 1);
	
	tFlipFlop TFF1(.clear(RST0), .CLK(CLK_IN), .T(w1), .Q(Q1), .Q_(), .SET(SET0));
	tFlipFlop TFF2(.clear(RST1), .CLK(Q1), .T(w1), .Q(Q2), .Q_(), .SET(SET1));
	
	wire Q1, Q2, w1;
	
	//LED A
	and(adm, !Q1, Q2);
	
	//LED B
	and(bdm, !Q2);
	
	//LED C
	and(cdm, Q1, !Q2);
	
	//LED D
	and(ddm, !Q1, Q2);
	
	//LED E
	and(edm, Q2);
	
	//LED F
	or(fdm, Q2, Q1);
	
	// LED G
	and(gdm, !Q1);
	
endmodule
