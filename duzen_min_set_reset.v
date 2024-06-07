module duzen_min_set_reset(P, H, M, L, A, G, SET0, SET1, RST0, RST1);
	input P, H, M, L, A, G;
	output SET0, SET1, RST0, RST1;
	
	wire SETQ0, RSTQ0, SETQ1, RSTQ1;
	
	// ----------------------
	
	// SET FF1
	wire and1, and2;
	
	and(and1, !M, !A);
	and(and2, M, !G);
	or(SETQ0, and1, and2, H);
	and(SET0, SETQ0, P);
	
	// RST FF1
	wire and3, and4;
	
	and(and3, !M, !G);
	and(and4, !H, M, !A);
	and(RSTQ0, and3, and4);
	and(RST0, RSTQ0, P);
	
	// -----------------------
	
	// SET FF2
	and(SETQ1, M, !A);
	and(SET1, SETQ1, P);
	
	// RST FF2
	or(RSTQ1, !M, !G);
	and(RST1, RSTQ1, P);
	
	// ----------------------
	
endmodule
