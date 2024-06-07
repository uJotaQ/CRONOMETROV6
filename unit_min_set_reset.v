module unit_min_set_reset(P, H, M, L, A, G, SET0, SET1, SET2, SET3, RST0, RST1, RST2, RST3);
	input P, H, M, L, A, G;
	output SET0, SET1, SET2, SET3, RST0, RST1, RST2, RST3;
	
	wire SETQ0, RSTQ0, SETQ2, RSTQ2;
	
	// ----------------------
	
	// SET FF1
	wire and1, and2;
	and(and1, !G, !H);
	and(and2, H, !G);
	or(SETQ0, and1, and2);
	and(SET0, SETQ0, P);

	// RESET FF1
	wire and3;
	and(and3, !H, M);
	or(RSTQ0, !A, and3);
	and(RST0, RSTQ0, P);
	
	
	
	// SET FF2
	and(SET1, P, 0);
	
	// RESET FF2
	and(RST1, P, 1);
	
	
	
	// SET FF3
	wire and4, and5;
	and(and4, !M, !G);
	and(and5, H, !G);
	or(SETQ2, and4, and5);
	and(SET2, SETQ2, P);
	
	// RESET FF3
	wire and6;
	and(and6, !H, M);
	or(RSTQ2, and6, !A);
	and(RST2, RSTQ2, P);
	
	
	
	// SET FF4
	and(SET3, P, 0);
	
	// RESET FF4
	and(RST3, P, 1);
	
endmodule
