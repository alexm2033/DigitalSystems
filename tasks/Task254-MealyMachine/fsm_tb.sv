module fsm_tb;

logic clk, x, reset, Q_moore, Q_mealy;

//Instantiate both FSM types
fsm_mealy u1(.clk(clk), .reset(reset), .X(x), .Q(Q_mealy));
fsm_moore u2(.clk(clk), .reset(reset), .X(x), .Q(Q_moore));

initial begin
   reset = '0;
   #10ps reset = '1;
end

initial begin
	clk = 0;
	repeat(20)
		#50ps clk = ~clk;

   //Generate clock here   

end

initial begin
   x = '0;
   @(negedge clk);
   
   //Write tests here
	@(posedge clk);
	#1ps assert(Q_mealy==0) $display("passed"); else $error("FAIL");

	@(negedge clk);
	x = 1;
	@(posedge clk);
	#1ps assert(Q_mealy==1) $display("passed"); else $error("FAIL");
	@(posedge clk);
	#1ps assert(Q_mealy==0) $display("passed"); else $error("FAIL");
	@(negedge clk);
	x = 0;
	@(posedge clk);
	#1ps assert(Q_mealy==0) $display("passed"); else $error("FAIL");


end

always @(posedge clk)begin
	#1ps assert(Q_mealy==Q_moore)$display("passed 1 = 2"); else $error("FAIL 1 != 2 ");
	end

endmodule

