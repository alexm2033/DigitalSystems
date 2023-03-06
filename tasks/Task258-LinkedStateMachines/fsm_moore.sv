
module fsm_moore (input logic CLK, N_RESET, X, READY, output logic RESET, START, Y);

typedef enum int unsigned { IDLE = 1, ST = 2, HD = 4, DT=8 } state_t;
state_t state, next_state;

always_comb begin : next_state_logic

   //Default is to stay in the current state
   next_state = state;

   //COMPLETE THIS
   case(state)

   IDLE: next_state = (X==1) ? ST : IDLE; 

   ST:   next_state = HD;

   HD:   if(X==0)
		next_state = IDLE;
	else if((X==1)&&(READY==1))
		next_state = DT;
	else
		next_state = HD;
            
   DT:  next_state = DT;
            
   default:
         next_state = IDLE; 
        

   endcase
end

always_ff @(posedge CLK or negedge N_RESET) begin

   if (N_RESET == '0)
      state <= IDLE;
   else
      state <= next_state;
end

always_comb begin : output_logic
   //COMPLETE THIS
	automatic logic Q = {START, RESET, Y};
   case(state)
   IDLE:	Q = 3'b010;
   ST:          Q = 3'b100;
   HD:          Q = 3'b000;
   DT:          Q = 3'b001;   
   default: 	Q = 3'b010;
   endcase
end

endmodule
