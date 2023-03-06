module pri_enc_rom (output logic [3:0] Y, input logic A, B, C);

logic[3] rom[8] ='{3'b000, 3'b100, 3'b100, 3'b100, 3'b101, 3'b101, 3'b110, 3'b111};

//logic [2:0] X;
//X = {A, B, C};
assign Y = rom[{A, B, C}];

endmodule