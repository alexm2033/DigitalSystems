module invN_tb;

parameter N=4;

logic [N-1:0] Y, X;

invN #(.N(N)) u1 (Y, X);

int expected_value [0:15] = {5,4,7,6,1,0,3,2,13,12,15,14,9,8,11,10};
initial
begin
static int i;
	for( i=0; i<2**N; i=i+1)begin
		X =i;
		#100ps;
		assert (Y == expected_value[i]) $display("expected value  = %d, Y = %d PASSED", expected_value[i], Y);

		else $error("FAIL");
		end
	end
endmodule