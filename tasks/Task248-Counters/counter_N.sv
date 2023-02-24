module counterN #(parameter N=8) (
	output logic [N-1:0] Y, 
	input  logic CLK, 
	input logic N_RESET, Dir );

logic [N-1:0] count;

//Connect output to internal register count
assign Y = count;

always_ff @(posedge CLK) begin
	if (N_RESET == 0) 
		count <= 0;
		
	else if((Dir==1) && (count< ((2**N)-1) ))
		count <= count + 1;
		
	else if ((Dir ==0) && (count > 0))
		count <= count - 1;
end

endmodule


 