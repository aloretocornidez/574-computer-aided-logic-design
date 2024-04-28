`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2016 02:30:38 PM
// Design Name: 
// Module Name: datapath_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequential_tb();

    //shiftreg
    reg [3:0] I;
    wire [3:0] Q;
    reg dir, din, clk, rst;
    
    //adder
    reg [3:0] A, B;
    wire [3:0] S;
    reg cin;
    wire cout;
    
    //comparator
    reg [3:0] X;
    reg signed [3:0] Y;
    wire gt, lt, eq;
    
    shiftreg shiftreg_1(I, Q, clk, rst, din, dir);
    adder4 adder4_1(A, B, S, cin, cout);
    comp4 comp4_1(X, Y, gt, lt, eq);
    
    always
        #10 clk <= ~clk; //clock procedure
               
    initial begin
        clk <= 0;		
        
        rst <= 1;
        #20 rst <= 0;
        #10;
        A <= 6; B <= 10; cin <= 0; //adder
        X <= 6; Y <= 10; //comparator
        @(posedge clk);
        #5 I <= 4'b0110; dir <= 1; din <= 0;
        #40 I <= 4'b1010; dir <= 1; din <= 1;
        
        #40;
        @(posedge clk);
        #5 I <= 4'b0110; dir <= 0; din <= 0;
        #40 I <= 4'b1010; dir <= 0; din <= 0;
    end
    
endmodule
