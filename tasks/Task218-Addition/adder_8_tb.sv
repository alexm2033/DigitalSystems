module adder_8_tb;

	parameter N = 8;

	logic [N-1:0] P, Q;
	logic [N-1:0] SUM;
	logic Cout;
	logic Cin;
	
	//Most significant bit of SUM = Cout
	adder_N #(.N(4)) u1(SUM, Cout, P[3:0], Q[3:0], Cin);

	adder_N #(.N(4)) u2(SUM, Cout, P[7:4], Q[7:4], Cin);

	assign u2 Cin = u1 Cout;

	initial 
	begin
	  automatic int S;
	  for (int c = 0; c<= 1; c = c + 1) begin
            Cin = c;
	    for (int i=0; i<2**N; i = i + 1) begin
              for (int j=i; j<2**N; j = j + 1) begin
                P = i;
                Q = j;
		S = c + i + j;	//Integer summation
                #10ps;
		assert ({Cout,SUM} == S) $display("PASS"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM);
              end
            end
	  end
	end
endmodule
