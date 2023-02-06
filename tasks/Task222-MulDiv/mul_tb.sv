module mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

initial
begin

	//Write test code here
for(int i=0; i<2**N; i=i+1) begin				//for loops to iterate A & B
	for(int j=0; j<2**N; j=j+1) begin
		A=i;
		B=j;
		//S=Y;
		#10ps;						//time passes
		if((i==0)&&(j==0))					//test lower edge condition
			assert (Y==0) $display("0 x 0 = %d", Y);
		if((i==15)&&(j==15))					//test upper edge condition
			assert (Y==225) $display("15 x 15 = %d", Y);
	end
end

end

endmodule