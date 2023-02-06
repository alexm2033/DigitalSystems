module adder_8_tb;

	parameter N = 4;		//set parameters
	parameter M = 2*N;

	logic [M-1:0] A, B, Y; 		//signals
	logic Cout;
	logic carry;
	
	adder_N #(.N(N)) u1(Y[N-1:0], carry, A[N-1:0], B[N-1:0], 0);		//instantiate componants

	adder_N #(.N(N)) u2(Y[M-1:N], Cout, A[M-1:N], B[M-1:N], carry);


	initial 
	begin
	  automatic int S;
	    for (int i=0; i<2**M; i = i + 1) begin		//loops to iterate through all possibe combinations
              for (int j=i; j<2**M; j = j + 1) begin
                A = i;
                B = j;
		S = i + j;	
                #10ps;						//time passes
		assert ({Cout,Y} == S) $display("PASS"); else $display("ERROR %d + %d <> %d", i, j, Y);		//test the results
              end
            end
	  end
endmodule
