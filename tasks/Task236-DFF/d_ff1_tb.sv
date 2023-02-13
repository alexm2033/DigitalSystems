module d_ff1_tb;

logic Q, D, n_Reset;
logic CLK = 0;

//instantiate componant
d_ff1 u1(Q, D, CLK, n_Reset);

initial
begin
	CLK = 0;
	repeat(20)
		#50ps CLK = ~CLK;
	
end

initial 
begin

	D = 0;
	n_Reset = 1;

	@(negedge CLK);
	D=1;
	@(posedge CLK);
	#1 assert(Q==D) $display("pass"); else $error("fail");

	@(negedge CLK);
	D=0;
	@(posedge CLK);
	#1 assert(Q==D) $display("pass"); else $error("fail");

	n_Reset = 0;

	@(negedge CLK);
	D=1;
	@(posedge CLK);
	#1 assert(Q==0) $display("pass"); else $error("fail");

	@(negedge CLK);
	D=0;
	@(posedge CLK);
	#1 assert(Q==0) $display("pass"); else $error("fail");

	n_Reset = 1;

	
	@(negedge CLK);
	D=1;
	@(posedge CLK);
	#1 assert(Q==D) $display("pass"); else $error("fail");
	#20;
	n_Reset = 0;
	#1 assert (Q!=D) $display("pass"); else $error("fail");

end
endmodule




