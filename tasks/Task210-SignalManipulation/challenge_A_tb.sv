module challenge_A_tb;

//internal signals
reg AA;
reg BB;
reg CC;
reg YY;

//instantiate componant under test
challenge_A u1 (YY, AA, BB, CC);

initial
begin
static int N = 0;
assign {AA,BB,CC}= N;

#50ps assert (YY ==0) $display("Pass %b", N);
N = 1;
#50ps assert (YY ==0) $display("Pass %b", N);
N = 2;
#50ps assert (YY ==1) $display("Pass %b", N);
N = 3;
#50ps assert (YY ==1) $display("Pass %b", N);
N = 4;
#50ps assert (YY ==1) $display("Pass %b", N);
N = 5;
#50ps assert (YY ==1) $display("Pass %b", N);
N = 6;
#50ps assert (YY ==0) $display("Pass %b", N);
N = 7;
#50ps assert (YY ==0) $display("Pass %b", N);
#50ps;
end

endmodule
