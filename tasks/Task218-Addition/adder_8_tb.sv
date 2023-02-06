module adder_8_tb;

	parameter N = 4;
	parameter M = 2*N;

	logic [M-1:0] A, B, Y; 
	logic Cout;
	logic carry;
	
	//Most significant bit of SUM = Cout
	adder_N #(.N(N)) u1(Y[N-1:0], Carry, A[N-1:0], B[N-1:0], 0);

	adder_N #(.N(N)) u2(Y[M-1:N], Cout, A[M-1:N], B[M-1:N], carry);


	initial 
	begin
	  automatic int S;
	    for (int i=0; i<2**M; i = i + 1) begin
              for (int j=i; j<2**M; j = j + 1) begin
                A = i;
                B = j;
		S = i + j;	//Integer summation
                #10ps;
		assert ({Cout,Y} == S) $display("PASS"); else $display("ERROR %d + %d <> %d", i, j, Y);
              end
            end
	  end
endmodule
