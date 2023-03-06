module mem_tb;

parameter DATA_WIDTH=8; 
parameter ADDR_WIDTH=3;
//internal signals

logic[(ADDR_WIDTH-1):0] addr, addr_1;
logic [(DATA_WIDTH-1):0] q, q_1;

single_port_rom_async #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) u1(addr, q);

single_port_rom_async2 #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) u2(addr_1, q_1);


	
initial
begin

	automatic logic [DATA_WIDTH-1:0] expected [0:((2**ADDR_WIDTH)-1)]='{

		8'b10101010, 8'b11110000, 8'b00001111, 8'b11001100,
		8'b11100111, 8'b00011000, 8'b10110111, 8'b11101101};

	for(int i=0; i<8; i=i+1)begin
		
		addr = i;
		#10ps;

		assert(q==expected[i]) $display("passed %d", i); else $error("Failed %d, expected = %b" ,i, expected[i]);
		assert(q==q_1) $display("passed %d" ,i); else $error("failed %d, expected = %b" ,i, expected[i]);
	end
end
	
endmodule	 



	
		
		