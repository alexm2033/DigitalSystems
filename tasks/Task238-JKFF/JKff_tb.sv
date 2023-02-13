module JKff_tb;

logic clk = 0;
logic Q,J,K;

JKff u1(Q, J, K, CLK);

initial begin

	CLK = 0;
	repeat(10)
		#50ps CLK =~CLK;
end

initial 
begin

	{J,K} = 2'b00;
	
	@(posedge CLK);
	{J,K} = 2'b10;
	@(negedge CLK);
	#1 assert (Q == 1) $display("Pass"); else $error("Fail");

	@(posedge CLK);
	{J,K} = 2'b01;
	@(negedge CLK);
	#1 assert (Q == 0) $display("Pass"); else $error("Fail;");

	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	#1 assert (Q == 0) $display("Pass latch 0"); else $error("Fail latch 0");

	@(posedge CLK);
	{J,K} = 2'b10;
	@(posedge CLK);
`	{J,K} = 2'b00;
	@(negedge CLK);
	#1 assert(Q == 1) $display("Pass latch 1"); else $error("Fail latch 1");
