module unit_min(CLK, CLK_OUT, P, H, M, L, A, G, aus, bus, cus, dus, eus, fus, gus);

	input CLK, P, H, M, L, A, G;
	output CLK_OUT, aus, bus, cus, dus, eus, fus, gus;
	
	wire Q1, Q2, Q3, Q4, RST_CLK, SET0, SET1, SET2, SET3, RST0, RST1, RST2, RST3;
	
	unit_min_set_reset umsr(P, H, M, L, A, G, SET0, SET1, SET2, SET3, RST0, RST1, RST2, RST3);
	
	or(w1, 1);
	
	wire w1, RST_1, RST_2, A1, A2, B1, B2, D1, D2, D3, E1, F1, F2, F3, G1, G2;
	
	// SETANDO RST APÓS CHEGAR NO 0
	and(RST_CLK, Q1, Q2, Q3, Q4);
	
	or(RST_1, RST_CLK, RST1);
	or(RST_2, RST_CLK, RST2);
	
	// ENVIANDO CLOCK PRO PROXIMO DIGITO
	and(CLK_OUT, Q1, Q2, Q3, Q4);
	
	tFlipFlop TFF1(.clear(RST0), .CLK(CLK), .T(w1), .Q(Q1), .Q_(), .SET(SET0));
	tFlipFlop TFF2(.clear(RST_1), .CLK(Q1), .T(w1), .Q(Q2), .Q_(), .SET(SET1));
	tFlipFlop TFF3(.clear(RST_2), .CLK(Q2), .T(w1), .Q(Q3), .Q_(), .SET(SET2));
	tFlipFlop TFF4(.clear(RST3), .CLK(Q3), .T(w1), .Q(Q4), .Q_(), .SET(SET3));
	
	// Led A
	and(A1, !Q2, !Q1, !Q3, Q4);
	and(A2, Q2, !Q3, !Q4);
	or(aus, A1, A2);
	
	// Led B
	and(B1, Q2, !Q3, Q4);
	and(B2, Q2, Q3, !Q4);
	or(bus, B1, B2);
	
	//LED C
	and(cus, !Q2, Q3, !Q4);
	
	//LED D
	and(D1, !Q2, !Q1, !Q3, Q4);
	and(D2, Q2, !Q3, Q4);
	and(D3, Q2, Q3, Q4);
	or(dus, D1, D2, D3);
	
	//LED E
	and(E1, Q2, !Q3);
	or(eus, E1, Q4);
	
	//LED F
	and(F1, !Q1, !Q2, Q4);
	and(F2, !Q2, Q3);
	and(F3, Q3, Q4);
	or(fus, F1, F2, F3);
	
	//LED G
	and(G1, !Q1, !Q2, !Q3);
	and(G2, Q2, Q3, Q4);
	or(gus, G1, G2);
	
	//or(gus, G1, G2);
	
endmodule
