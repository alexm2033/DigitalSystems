module mux4_behavioural_v2_tb;

//Internal signals for testing
logic y2;
logic [7:0] x;
logic [3:0] ss; //2 bit signal

//Instantiate the component under test
//mux4_behavioural_v2 u1(y2, x, ss);
muxN #(.N(8)) u1(out, x s);	//Instantiate 8 bit mux

initial
begin
	//Unpacked array of expected (correct) outputs. Automatic means this has local scope
	automatic logic expected[8] = {1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1};

	//Set inputs (note the direction)
	x = 8'b10101100;

	//Iterate over all input sequences
	for (int n=0; n<8; n = n + 1) begin
		//Set the select line
		ss = n;

		//Add a delay so that the outputs update
		#10ps;

	        //Check output is the expected value
    	        assert (out == expected[n])
                  //Note how $display and $error can be used much like printf in C
                  $display("Passed test %d, output=%d, expected=%d", n, y2, expected[n]);
                else
                   $error("Error for test %d: expected %d and got %d", n, expected[n], y2);		
	end
end

endmodule