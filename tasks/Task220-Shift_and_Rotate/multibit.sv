module multibit #(parameter N=8, M=1) (output logic [N-1:0] Y, input logic [N-1:0] X, logic DIR);

assign Y = (DIR==1) ? {X[M-1:0], X[N-1:M]} : {X[N-(1+M):0], X[N-1:N-(1+(M-1))]};

endmodule