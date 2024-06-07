module duzen_sec(CLK_IN, CLK_OUT, P, ADS, BDS, CDS, DDS, EDS, FDS, GDS);
	
	input CLK_IN, P;
	output CLK_OUT, ADS, BDS, CDS, DDS, EDS, FDS, GDS;
	
	wire Q1, Q2, Q3, RST_CLK, RST_CLK1;
	
	and(w1, 1);
	
	// SETANDO RST APÓS CHEGAR NO 0
	and(RST_CLK, Q1, Q2, Q3);
	or(RST_CLK1, P, RST_CLK);
	
	// ENVIANDO CLOCK PRO PROXIMO DIGITO
	and(CLK_OUT, Q1, Q2, Q3);
	
	tFlipFlop TFF1(.clear(P), .CLK(CLK_IN), .T(w1), .Q(Q1), .Q_(), .SET());
	tFlipFlop TFF2(.clear(RST_CLK1), .CLK(Q1), .T(w1), .Q(Q2), .Q_(), .SET());
	tFlipFlop TFF3(.clear(P), .CLK(Q2), .T(w1), .Q(Q3), .Q_(), .SET());
	
	wire w1, a1, a2, d1, d2, e1, e2, e3, f1, f2, g1, g2;
	
	// LED A
	and(a1, Q1, !Q2, !Q3);
	and(a2, !Q1, !Q2, Q3);
	or(ADS, a1, a2);
	
	// LED B
	and(BDS, Q1, !Q2, Q3);
	
	// LED C
	and(CDS, !Q1, Q2, !Q3);
	
	// LED D
	and(d1, Q1, !Q2, !Q3);
	and(d2, !Q1, !Q2, Q3);
	or(DDS, d1, d2);
	
	// LED E
	or(e1, !Q2, !Q3);
	and(e2, Q1, e1);
	and(e3, !Q1, !Q2, Q3);
	or(EDS, e2, e3);
	
	// LED F
	and(f1, Q1, !Q3);
	and(f2, !Q1, Q2, !Q3);
	or(FDS, f1, f2);
	
	// LED G
	and(g1, !Q1, !Q2, !Q3);
	and(g2, Q1, !Q2, !Q3);
	or(GDS, g1, g2);


endmodule
