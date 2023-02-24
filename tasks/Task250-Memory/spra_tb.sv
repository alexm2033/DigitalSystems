module spra_tb;

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 8;

logic [(ADDR_WIDTH-1):0] addr;
logic [(DATA_WIDTH-1):0] q, q1;

single_port_rom_async # (.ADDR_WIDTH(ADDR_WIDTH)) u1(addr, q);

single_port_rom_async2 # (.ADDR_WIDTH(ADDR_WIDTH)) u2(addr, q1);

initial begin

	for(int i=0; i<2**ADDR_WIDTH; i=i+1) begin

		q  = addr[i];
		q1 = addr[i];

		assert(q==q1) $display("Passed for %d", i); else $error("Failed fror %d", i);
	end
end
endmodule
	
	