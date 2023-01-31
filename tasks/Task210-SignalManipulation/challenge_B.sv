module challenge_B(output wire Y, input wire A, B ,C );

//internal wires
wire inv_A;
wire inv_B;
wire inv_C;
wire and_1;
wire and_2;

//set out gates
not #(5ps) u1 (inv_A, A);
not #(5ps) u2 (inv_B, B);
not #(5ps)u3 (inv_C, C);
and #(5ps) u4 (and_1, inv_A, B, inv_C);
and #(5ps) u5 (and_2, A, inv_B, C);
or  #(5ps) u6 (Y, and_1, and_2);

endmodule
