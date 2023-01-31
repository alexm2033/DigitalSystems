module challenge_B_tb;

//internal wires
logic AA;
logic BB;
logic CC;
logic YY;

//instantiate componant under test
challenge_B u1 (YY, AA, BB, CC);

initial
begin

static int X;
assign {AA,BB,CC}= X;

for (int i =0; i<8; i = i+1)
begin
	#50ps X =i;
	if((i==2)||(i==5))
	assert (YY==1) $display("passed %d", i);
	
	else
	assert (YY!=1) $display("passed %d", i);


	end
#50ps;
X = 3'b010;
#100ps;
X = 3'b101;
#100ps;

end

endmodule