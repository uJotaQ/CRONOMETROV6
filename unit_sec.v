module unit_sec(CLK, CLK_OUT, P, G, A, aus, bus, cus, dus, eus, fus, gus);

	input CLK, P, G, A;
	output CLK_OUT, aus, bus, cus, dus, eus, fus, gus;
	
	wire Q1, Q2, Q3, Q4, RST_CLK, w1, RST_CLK1, A1, A2, B1, B2, D1, D2, D3, E1, F1, F2, F3, G1, G2;
	
	or(w1, G, A);
	
	// SETANDO RST APÓS CHEGAR NO 0
	and(RST_CLK, Q1, Q2, Q3, Q4);
	or(RST_CLK1, P, RST_CLK);
	
	// ENVIANDO CLOCK PRO PROXIMO DIGITO
	and(CLK_OUT, Q1, Q2, Q3, Q4);
	
	// DEFININDO FFs
	tFlipFlop TFF1(.clear(P), .CLK(CLK), .T(w1), .Q(Q1), .Q_(), .SET());
	tFlipFlop TFF2(.clear(RST_CLK1), .CLK(Q1), .T(w1), .Q(Q2), .Q_(), .SET());
	tFlipFlop TFF3(.clear(RST_CLK1), .CLK(Q2), .T(w1), .Q(Q3), .Q_(), .SET());
	tFlipFlop TFF4(.clear(P), .CLK(Q3), .T(w1), .Q(Q4), .Q_(), .SET());
	
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
	
endmodule
