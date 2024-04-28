`timescale 1ns / 1ps

module RounderTB();
   parameter WIDTH = 16;
   reg [WIDTH-1 : 0] A_tb;
   wire [WIDTH-1 : 0] R_tb;
   
   testRounder ROUNDER_0(A_tb, R_tb);
   
   // Test vectors (should have more test vectors for a 
   // 32-bit design
   initial begin
     A_tb <= 0;
     #10 A_tb <= 1;
     #10 A_tb <= 2;
     #10 A_tb <= 3;
     #10 A_tb <= 4;
     #10 A_tb <= 5;
     #10 A_tb <= 6;
     #10 A_tb <= 7;
   end
endmodule