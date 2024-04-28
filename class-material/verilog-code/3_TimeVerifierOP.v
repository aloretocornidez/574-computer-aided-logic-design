`timescale 1 ns/1 ns
module TimeVerifierOP(Clk, Rst, CStart, CEnd, ErrorRst, Error);
   input Clk, Rst;
   input CStart, CEnd, ErrorRst;
   output reg Error;
 
   parameter S_Wait = 0, 
             S_Cycle1 = 1, 
             S_Cycle2 = 2, 
             S_CycleEnd = 3, 
             S_Error = 4;
             
   reg [2:0] State;
   
   // One procedure FSM
   always @(posedge Clk) begin
      if (Rst == 1) begin
         State <= S_Wait;
         Error <= 0;
      end
      else begin
         case (State) 
            S_Wait : begin
               Error <= 0;
               if (CStart == 1) begin
                  State <= S_Cycle1;
               end 
               else begin
                  State <= S_Wait;
               end
            end
            
            S_Cycle1 : begin
               Error <= 0;
               if (CEnd == 1) begin
                  State <= S_Error;
               end
               else begin 
                  State <= S_Cycle2;
               end
            end
              
            S_Cycle2 : begin
               Error <= 0;
               if(CEnd == 1) begin
                  State <= S_CycleEnd;
               end
               else begin
                  State <= S_Error;
               end
            end
              
            S_CycleEnd : begin
               Error <= 0;
               if (CEnd == 1) begin
                  State <= S_Error;
               end
               else begin
                  State <= S_Wait;
               end
            end
              
            S_Error : begin
               Error <= 1;
               if (ErrorRst == 1) begin
                  State <= S_Wait;
               end
               else begin
                  State <= S_Error;
               end
            end
         endcase
      end 
   end
endmodule
