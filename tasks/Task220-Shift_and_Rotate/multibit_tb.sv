module multibit_tb;

parameter N=8;		//set parameters
parameter M=3;

logic [N-1:0] XX, YY;	//declare input/outputs

logic DIR = 1;

multibit #(.N(N), .M(M)) u1(YY, XX, DIR);	//instantiate  module to test

initial			//initial block runs once
begin

XX = 8'b10101100;	//set initial value of input

DIR = 1'b1;		//set condition

$display("Rotate right");

for(int i =0; i<=N-1;i=i+1)
begin
	$display("Xinit = %b", XX);	//print initial value of loop
	#10ps;				// pass time
	XX = YY;			//update value of input for next itteration
	$display("Xrot = %b", YY);	//print output
end

DIR = 1'b0;

XX = 8'b10101100;

$display("Rotate left");

for(int i=0; i<=N-1; i=i+1)
	begin
	$display("Xinit = %b", XX);
	#10ps;
	XX = YY;
	$display("Xrot = %b", YY);
end
end
endmodule
