module challenge_A(output wire Y, input wire A, B, C);

//internal wires
wire term_2;
wire term_3;
wire term_4;
wire term_5;

//continuous assignment
assign Y = term_2 | term_3 | term_4 | term_5;

assign term_2 = ~A & B & ~C;
assign term_3 = ~A & B & C;
assign term_4 = A & ~B & ~C;
assign term_5 = A & ~B & C;

endmodule

