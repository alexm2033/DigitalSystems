module mux2_structural (output wire y, input wire a, b, s);

// Write HDL here

//internal wires
wire invS;
wire andA;
wire andB;

//place and connect gates
not u1 (invS, s);
and u2 (andA, a, invS);
and u3 (andB, b, s);
or  u4 (y, andA, andB);
endmodule