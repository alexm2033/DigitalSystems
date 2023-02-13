module d_ffN_tb;

parameter N=8;

logic CLK = 0;
logic [N-1:0] Q,D,X;
logic n_Reset, EN;

//logic word = 8'b11010010;

d_ffN #(.N(N)) u1(Q, D, CLK, n_Reset, EN);

//power on reset
initial
begin
	n_Reset = 0;
	#10ps;
	n_Reset = 1;
end

//generate clock signal
initial 
begin
CLK = 0;
	repeat(20)
		#50ps CLK = ~CLK;
end

initial
begin

	@(posedge n_Reset);		//wait for reset to clear
	@(negedge CLK);
	D = 8'b11010010;
	X = D;
	EN = 1;
	@(posedge CLK);
	#11 assert(Q == D) $display("Pass"); else $error("Fail");

	@(negedge CLK);
	EN = 0;
	D = 8'b0;
	@(posedge CLK);
	#11 assert(Q == X) $display("Pass"); else $error("Fail");

	#10 n_Reset = 0;
end

always @(negedge n_Reset)begin
	#11 assert(Q == 0) $display("Pass"); else $error("Fail");

end
endmodule






	

		

	



	
