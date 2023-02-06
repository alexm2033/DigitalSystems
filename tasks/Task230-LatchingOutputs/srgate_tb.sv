module srgate_tb;

logic Q, Qbar, S,R;

srgate u1(Q, Qbar, S, R);

initial
begin

	#100ps;
	assert (Q===1'bx)  $display("PASS"); else $error("FAIL");
	assert (Qbar===1'bx) $display("PASS"); else $error("FAIL");

	{S,R} = 2'b10;
	#100ps;
	assert (Q===1'b1) $display("PASS"); else $error("FAIL");
	assert (Qbar=== 1'b0) $display("PASS"); else $error ("FAIL");

	{S,R} = 2'b00;
	#100ps;
	assert (Q===1'b1) $display("PASS"); else $error("FAIL");
	assert (Qbar=== 1'b0) $display("PASS"); else $error ("FAIL");

	{S,R} = 2'b01;
	#100ps;
	assert (Q===1'b0) $display("PASS"); else $error("FAIL");
	assert (Qbar=== 1'b1) $display("PASS"); else $error ("FAIL");

	{S,R} = 2'b00;
	#100ps;
	assert (Q===1'b0) $display("PASS"); else $error("FAIL");
	assert (Qbar=== 1'b1) $display("PASS"); else $error ("FAIL");

	{S,R} = 2'b11;
	#100ps;
	assert (Q===1'bz) $display("PASS"); else $error("FAIL");
	assert (Qbar=== 1'bz) $display("PASS"); else $error ("FAIL");

	end

always @(S, R)
begin
	$display ("S = %d, R = %d", S, R);
end
always @(Q)
begin
	$display ("Q = %d",Q);
end
endmodule