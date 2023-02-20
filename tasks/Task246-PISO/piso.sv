module piso #(parameter n=8)(output logic S_out, input logic Shift, CLK, EN, N_Reset, GND, logic [n-1 :0] Data );

logic [n-1:0] sr;

assign S_out = sr[0];

always_ff @(posedge CLK, negedge N_Reset)begin

	if(N_Reset==0)begin
		sr = 'b0;
	end

	else begin

	if(EN==1)begin
	
		case(EN)
			0 : sr <= Data;

			1 : sr <= {1'b0, sr[n-1:1]};

		endcase
		end
	end
end
endmodule
		
