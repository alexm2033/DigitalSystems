module JKff(output logic Q, input logic J, K, CLK);

always_ff @(negedge CLK)begin

	if({J,K}==2'b10)
		Q <= 1;

	else if({J,K}==2'b01)
		Q <= 0;

	else if({J,K}==2'b11)
		Q <= ~Q;

end
endmodule