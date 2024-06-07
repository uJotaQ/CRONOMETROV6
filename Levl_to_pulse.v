module Levl_to_pulse(L, CLK,P);
	input L, CLK;
	output P;
	
	wire w1, w2, w3, QF0, QF1;
	
	and(w1, QF0, L);
	
	dFlipFlop F0 (
        .d(L),
        .rstn(1'b0),
        .clk(CLK),
		  .set(1'b0),
        .q(QF0),
        .q_()
    );
	 
	 dFlipFlop F1 (
        .d(w1),
        .rstn(1'b0),
        .clk(CLK),
		  .set(1'b0),
        .q(),
        .q_(QF1)
    );
	 
	 and(P, QF1, QF0);
	
endmodule
